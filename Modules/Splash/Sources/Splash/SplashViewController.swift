//
//  SplashViewController.swift
//
//
//  Created by Ramazan Ceylan on 12.09.2024.
//

import UIKit
import WebKit
import Common
import AppResources

public class SplashViewController: UIViewController {

  // Completion handler when splash finishes
  public var onSplashFinished: (() -> Void)?

  private var webView: WKWebView!
  private let viewModel = SplashViewModel() // SplashViewModel to manage Spotify login

  public override func viewDidLoad() {
    super.viewDidLoad()

    // Spotify splash screen with logo
    setupSpotifySplashScreen()

    // Start splash logic after 2 seconds
    startSplash()
  }

  // Setup Spotify-like splash screen
  private func setupSpotifySplashScreen() {
    // Background color (black, as Spotify uses a dark theme)
    view.backgroundColor = .black

    // Create an image view for the Spotify logo
    let logoImageView = UIImageView(image: AssetManager.appImage(.splash))
    logoImageView.contentMode = .scaleAspectFit
    logoImageView.translatesAutoresizingMaskIntoConstraints = false

    // Add the logo image view to the main view
    view.addSubview(logoImageView)

    // Center the logo on the screen
    NSLayoutConstraint.activate([
      logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      logoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      logoImageView.widthAnchor.constraint(equalToConstant: 200), // Adjust as necessary
      logoImageView.heightAnchor.constraint(equalToConstant: 200) // Adjust as necessary
    ])
  }

  // Simulate a splash screen, then check session status
  private func startSplash() {
    DispatchQueue.main.asyncAfter(deadline: .now() + 2) { // 2 seconds splash time
      if SessionManager.shared.isLoggedIn {
        // If user is already logged in, go directly to Home
        self.onSplashFinished?()
      } else {
        // If not logged in, start Spotify login
        self.startSpotifyLogin()
      }
    }
  }

  // Start the Spotify login process
  private func startSpotifyLogin() {
    if let url = viewModel.getSpotifyAuthorizationURL() {
      webView = WKWebView(frame: view.frame)
      webView.navigationDelegate = self
      view.addSubview(webView)
      let request = URLRequest(url: url)
      webView.load(request)
    }
  }
}

// MARK: - WKNavigationDelegate
extension SplashViewController: WKNavigationDelegate {

  public func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {

    if let url = navigationAction.request.url, url.absoluteString.starts(with: "spotifyclone://callback") {
      if let code = extractAuthorizationCode(from: url) {
        viewModel.exchangeCodeForToken(authCode: code) { result in
          switch result {
          case .success(let tokenResponse):
            // Save login state and transition to next screen
            SessionManager.shared.login()
            self.onSplashFinished?()
          case .failure(let error):
            print("Error: \(error.localizedDescription)")
          }
        }
      }
      decisionHandler(.cancel)
      webView.removeFromSuperview()
      return
    }

    decisionHandler(.allow)
  }

  private func extractAuthorizationCode(from url: URL) -> String? {
    guard let components = URLComponents(url: url, resolvingAgainstBaseURL: false),
          let queryItems = components.queryItems else {
      return nil
    }
    return queryItems.first(where: { $0.name == "code" })?.value
  }
}

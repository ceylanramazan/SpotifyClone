//
//  LoginViewController.swift
//
//
//  Created by Ramazan Ceylan on 12.09.2024.
//

// LoginViewController.swift
import UIKit
import WebKit

public class LoginViewController: UIViewController {

  public var onLoginSuccess: (() -> Void)? // Completion handler for successful login

  private var webView: WKWebView!
  private let viewModel = LoginViewModel()

  public override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white

    setupLoginButton()
  }

  private func setupLoginButton() {
    let loginButton = UIButton(type: .system)
    loginButton.setTitle("Login with Spotify", for: .normal)
    loginButton.addTarget(self, action: #selector(startSpotifyLogin), for: .touchUpInside)

    loginButton.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(loginButton)

    NSLayoutConstraint.activate([
      loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      loginButton.widthAnchor.constraint(equalToConstant: 200),
      loginButton.heightAnchor.constraint(equalToConstant: 50)
    ])
  }

  @objc private func startSpotifyLogin() {
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
extension LoginViewController: WKNavigationDelegate {

  public func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {

    if let url = navigationAction.request.url, url.absoluteString.starts(with: "spotifyclone://callback") {
      if let code = extractAuthorizationCode(from: url) {
        print("Authorization Code: \(code)")

        viewModel.exchangeCodeForToken(authCode: code) { result in
          switch result {
          case .success(let tokenResponse):
            print("Access Token: \(tokenResponse.accessToken)")
            self.onLoginSuccess?() // Trigger the onLoginSuccess closure
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

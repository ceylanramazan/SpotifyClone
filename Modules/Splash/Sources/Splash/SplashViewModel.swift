//
//  SplashViewModel.swift
//
//
//  Created by Ramazan Ceylan on 13.09.2024.
//

import Foundation
import Network

public class SplashViewModel {

  private let loginService: LoginServiceProtocol

  // Initialize with the login service dependency
  public init(loginService: LoginServiceProtocol = LoginService()) {
    self.loginService = loginService
  }

  // Retrieves the Spotify authorization URL
  public func getSpotifyAuthorizationURL() -> URL? {
    return loginService.getAuthorizationURL()
  }

  // Exchanges the authorization code for an access token
  public func exchangeCodeForToken(authCode: String, completion: @escaping (Result<TokenResponse, NetworkError>) -> Void) {
    loginService.exchangeCodeForToken(authCode: authCode, completion: completion)
  }
}

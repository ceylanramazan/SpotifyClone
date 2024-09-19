//
//  File.swift
//
//
//  Created by Ramazan Ceylan on 12.09.2024.
//

import Foundation
import Network

class LoginViewModel {

  private let loginService: LoginServiceProtocol

  // ViewModel initializes with a LoginService dependency
  init(loginService: LoginServiceProtocol = LoginService()) {
    self.loginService = loginService
  }

  // Retrieves the Spotify authorization URL
  func getSpotifyAuthorizationURL() -> URL? {
    return loginService.getAuthorizationURL()
  }

  // Exchanges authorization code for an access token
  func exchangeCodeForToken(authCode: String, completion: @escaping (Result<TokenResponse, NetworkError>) -> Void) {
    loginService.exchangeCodeForToken(authCode: authCode, completion: completion)
  }
}

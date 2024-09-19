//
//  LoginServiceProtocol.swift
//
//
//  Created by Ramazan Ceylan on 13.09.2024.
//

import Foundation

// Protocol for login service
public protocol LoginServiceProtocol {
  func getAuthorizationURL() -> URL?
  func exchangeCodeForToken(authCode: String, completion: @escaping (Result<TokenResponse, NetworkError>) -> Void)
}

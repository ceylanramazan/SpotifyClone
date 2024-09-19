//
//  TokenResponse.swift
//
//
//  Created by Ramazan Ceylan on 13.09.2024.
//

import Foundation

public struct TokenResponse: Decodable {
  public let accessToken: String
  public let tokenType: String
  public let expiresIn: Int
  public let refreshToken: String?

  enum CodingKeys: String, CodingKey {
    case accessToken = "access_token"
    case tokenType = "token_type"
    case expiresIn = "expires_in"
    case refreshToken = "refresh_token"
  }
}

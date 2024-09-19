//
//  Endpoint.swift
//
//
//  Created by Ramazan Ceylan on 12.09.2024.
//

import Alamofire

// Protocol for defining an API endpoint
public protocol Endpoint {
  var url: String { get }
  var method: HTTPMethod { get }
  var parameters: [String: String]? { get }
  var headers: HTTPHeaders? { get }
}

// Spotify-specific endpoints
public enum SpotifyEndpoint: Endpoint {

  case login(clientID: String, redirectURI: String, scope: String)
  case exchangeCodeForToken(code: String, clientID: String, clientSecret: String, redirectURI: String)

  public var url: String {
    switch self {
    case .login:
      return "https://accounts.spotify.com/authorize"
    case .exchangeCodeForToken:
      return "https://accounts.spotify.com/api/token"
    }
  }

  public var method: HTTPMethod {
    switch self {
    case .login:
      return .get
    case .exchangeCodeForToken:
      return .post
    }
  }

  public var parameters: [String : String]? {
    switch self {
    case .login(let clientID, let redirectURI, let scope):
      return [
        "client_id": clientID,
        "response_type": "code",
        "redirect_uri": redirectURI,
        "scope": scope
      ]
    case .exchangeCodeForToken(let code, let clientID, let clientSecret, let redirectURI):
      return [
        "grant_type": "authorization_code",
        "code": code,
        "redirect_uri": redirectURI,
        "client_id": clientID,
        "client_secret": clientSecret
      ]
    }
  }

  public var headers: HTTPHeaders? {
    switch self {
    case .login:
      return nil
    case .exchangeCodeForToken:
      return [
        "Content-Type": "application/x-www-form-urlencoded"
      ]
    }
  }
}

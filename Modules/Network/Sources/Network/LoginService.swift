//
//  LoginService.swift
//
//
//  Created by Ramazan Ceylan on 13.09.2024.
//

import Foundation
import Alamofire
import Common

public class LoginService: LoginServiceProtocol {

  private let networkService: NetworkServiceProtocol
  private let clientID = "caf4c7f4b3844094b8b5fa6f038aac5e"
  private let clientSecret = "41dbddd84ec444a29d62deac535b45b4"
  private let redirectURI = "spotifyclone://callback"

  public init(networkService: NetworkServiceProtocol = NetworkService.shared) {
    self.networkService = networkService
  }

  public func getAuthorizationURL() -> URL? {
    let endpoint = SpotifyEndpoint.login(clientID: clientID, redirectURI: redirectURI, scope: "user-read-private user-read-email")
    let urlString = endpoint.url + "?" + (endpoint.parameters?.queryString() ?? "")
    return URL(string: urlString)
  }

  public func exchangeCodeForToken(authCode: String, completion: @escaping (Result<TokenResponse, NetworkError>) -> Void) {
    let endpoint = SpotifyEndpoint.exchangeCodeForToken(code: authCode, clientID: clientID, clientSecret: clientSecret, redirectURI: redirectURI)
    networkService.request(endpoint: endpoint, completion: completion)
  }
}

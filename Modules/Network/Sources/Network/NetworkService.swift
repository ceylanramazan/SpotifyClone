//
//  File.swift
//
//
//  Created by Ramazan Ceylan on 12.09.2024.
//

import Alamofire
import Foundation

public class NetworkService: NetworkServiceProtocol {

  public static let shared = NetworkService()

  private init() {}

  // Executes the API request using an Endpoint
  public func request<T: Decodable>(
    endpoint: Endpoint,
    completion: @escaping (Result<T, NetworkError>) -> Void
  ) {
    AF.request(endpoint.url, method: endpoint.method, parameters: endpoint.parameters, encoding: URLEncoding.default, headers: endpoint.headers)
      .validate()
      .responseData { response in
        switch response.result {
        case .success(let data):
          do {
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            completion(.success(decodedData))
          } catch {
            completion(.failure(.decodingError(error)))
          }
        case .failure(let error):
          if let statusCode = response.response?.statusCode {
            completion(.failure(self.mapStatusCodeToError(statusCode)))
          } else {
            completion(.failure(.unknown(error)))
          }
        }
      }
  }

  // Maps status codes to NetworkError
  private func mapStatusCodeToError(_ statusCode: Int) -> NetworkError {
    switch statusCode {
    case 400: return .badRequest
    case 401: return .unauthorized
    case 403: return .forbidden
    case 404: return .notFound
    case 500: return .serverError
    default: return .badResponse
    }
  }
}

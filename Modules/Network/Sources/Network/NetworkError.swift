//
//  NetworkError.swift
//
//
//  Created by Ramazan Ceylan on 13.09.2024.
//

import Foundation

public enum NetworkError: Error {
  case badRequest          // 400 error
  case unauthorized        // 401 error
  case forbidden           // 403 error
  case notFound            // 404 error
  case serverError         // 500 error
  case badResponse         // Unexpected response format
  case decodingError(Error) // JSON decoding error
  case unknown(Error)       // Any other unknown error

  public var localizedDescription: String {
    switch self {
    case .badRequest:
      return "Bad Request (400)"
    case .unauthorized:
      return "Unauthorized (401)"
    case .forbidden:
      return "Forbidden (403)"
    case .notFound:
      return "Not Found (404)"
    case .serverError:
      return "Server Error (500)"
    case .badResponse:
      return "Invalid response from server."
    case .decodingError(let error):
      return "Decoding Error: \(error.localizedDescription)"
    case .unknown(let error):
      return "Unknown Error: \(error.localizedDescription)"
    }
  }
}

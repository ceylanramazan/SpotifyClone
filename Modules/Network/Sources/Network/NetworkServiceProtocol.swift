//
//  File.swift
//  
//
//  Created by Ramazan Ceylan on 13.09.2024.
//

import Foundation

public protocol NetworkServiceProtocol {
  func request<T: Decodable>(
    endpoint: Endpoint,
    completion: @escaping (Result<T, NetworkError>) -> Void
  )
}

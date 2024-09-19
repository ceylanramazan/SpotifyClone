//
//  Dictionary+Extensions.swift
//
//
//  Created by Ramazan Ceylan on 13.09.2024.
//

import Foundation

public extension Dictionary where Key == String, Value == String {
  // Converts a dictionary to a URL query string format
  func queryString() -> String {
    return self.map { "\($0.key)=\($0.value)" }
      .joined(separator: "&")
      .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
  }
}

//
//  SessionManager.swift
//
//
//  Created by Ramazan Ceylan on 13.09.2024.
//

import Foundation

// Singleton class to manage user session
public class SessionManager {

  // Singleton instance
  public static let shared = SessionManager()

  // Private initializer to prevent outside instantiation
  private init() {}

  // Check if the user is logged in
  public var isLoggedIn: Bool {
    return UserDefaults.standard.bool(forKey: "isLoggedIn")
  }

  // Save login state when user logs in
  public func login() {
    UserDefaults.standard.set(true, forKey: "isLoggedIn")
  }

  // Clear login state when user logs out
  public func logout() {
    UserDefaults.standard.set(false, forKey: "isLoggedIn")
  }
}

//
//  File.swift
//
//
//  Created by Ramazan Ceylan on 12.09.2024.
//

import UIKit
import Splash
import Login
import Home

enum AppScreen {
  case splash
  case login
  case home

  // Associated view controller type for each screen
  var viewControllerType: UIViewController.Type {
    switch self {
    case .splash:
      return SplashViewController.self
    case .login:
      return LoginViewController.self
    case .home:
      return HomeViewController.self
    }
  }
}

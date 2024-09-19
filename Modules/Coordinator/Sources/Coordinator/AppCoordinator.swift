//
//  AppCoordinator.swift
//
//
//  Created by Ramazan Ceylan on 12.09.2024.
//

import UIKit

open class AppCoordinator: Coordinator {

  var router: Router
  var childCoordinators = [Coordinator]()
  let screenFactory = ScreenFactory()  // Central factory to create view controllers and coordinators

  public init(router: Router) {
    self.router = router
  }

  public func start() {
    navigate(to: .splash)
  }

  // Central navigation function using the screen factory
  func navigate(to screen: AppScreen) {
    guard let coordinator = screenFactory.createCoordinator(for: screen, router: router) else {
      return
    }

    addChild(coordinator)
    coordinator.start()

    coordinator.onFinish = { [weak self] in
      self?.removeChild(coordinator)

      // Define transitions based on the screen
      switch screen {
      case .splash:
        self?.navigate(to: .login)
      case .login:
        self?.navigate(to: .home)
      default:
        break
      }
    }
  }

  // Add/remove child coordinators
  func addChild(_ coordinator: Coordinator) {
    childCoordinators.append(coordinator)
  }

  func removeChild(_ coordinator: Coordinator) {
    childCoordinators = childCoordinators.filter { $0 !== coordinator }
  }
}

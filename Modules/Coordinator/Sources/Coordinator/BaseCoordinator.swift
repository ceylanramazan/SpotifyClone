//
//  BaseCoordinator.swift
//
//
//  Created by Ramazan Ceylan on 12.09.2024.
//

import UIKit

class BaseCoordinator<T: UIViewController>: Coordinator {
  var router: Router
  var childCoordinators = [Coordinator]()
  var viewController: T?

  init(router: Router) {
    self.router = router
  }

  // Start method pushes the viewController onto the navigation stack using the router
  func start() {
    let vc = T()
    self.viewController = vc
    router.push(vc, animated: true)
  }

  // Add and remove child coordinators
  func addChild(_ coordinator: Coordinator) {
    childCoordinators.append(coordinator)
  }

  func removeChild(_ coordinator: Coordinator) {
    childCoordinators = childCoordinators.filter { $0 !== coordinator }
  }
}


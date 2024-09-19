//
//  ScreenFactory.swift
//
//
//  Created by Ramazan Ceylan on 12.09.2024.
//

import UIKit

class ScreenFactory {

  // Create a view controller dynamically based on AppScreen enum
  func createViewController(for screen: AppScreen) -> UIViewController {
    let viewControllerType = screen.viewControllerType
    return viewControllerType.init()  // Create instance of the associated view controller
  }

  // Create a coordinator for the given screen dynamically
  func createCoordinator(for screen: AppScreen, router: Router) -> GenericCoordinator? {
    let viewController = createViewController(for: screen)
    return GenericCoordinator(router: router, viewController: viewController)
  }
}


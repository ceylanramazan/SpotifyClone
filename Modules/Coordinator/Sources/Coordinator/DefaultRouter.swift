//
//  DefaultRouter.swift
//
//
//  Created by Ramazan Ceylan on 12.09.2024.
//

import UIKit

open class DefaultRouter: Router {
  weak public var navigationController: UINavigationController?

  public init(navigationController: UINavigationController?) {
    self.navigationController = navigationController
  }

  // Push a view controller onto the navigation stack
  public func push(_ viewController: UIViewController, animated: Bool) {
    navigationController?.pushViewController(viewController, animated: animated)
  }

  // Pop the last view controller off the navigation stack
  public func pop(animated: Bool) {
    navigationController?.popViewController(animated: animated)
  }

  // Present a view controller modally
  public func present(_ viewController: UIViewController, animated: Bool, completion: (() -> Void)?) {
    navigationController?.present(viewController, animated: animated, completion: completion)
  }

  // Dismiss the currently presented view controller
  public func dismiss(animated: Bool, completion: (() -> Void)?) {
    navigationController?.dismiss(animated: animated, completion: completion)
  }

  // Pop to a specific view controller type in the navigation stack
  public func popToViewController(ofType type: UIViewController.Type, animated: Bool) {
    if let viewController = navigationController?.viewControllers.first(where: { $0.isKind(of: type) }) {
      navigationController?.popToViewController(viewController, animated: animated)
    }
  }

  // Set a new root view controller and clear the stack
  public func setRootViewController(_ viewController: UIViewController, animated: Bool) {
    navigationController?.setViewControllers([viewController], animated: animated)
  }
}



//
//  Router.swift
//
//
//  Created by Ramazan Ceylan on 12.09.2024.
//

import UIKit

public protocol Router {
  var navigationController: UINavigationController? { get set }

  // Navigation actions
  func push(_ viewController: UIViewController, animated: Bool)
  func pop(animated: Bool)
  func present(_ viewController: UIViewController, animated: Bool, completion: (() -> Void)?)
  func dismiss(animated: Bool, completion: (() -> Void)?)
  func popToViewController(ofType type: UIViewController.Type, animated: Bool)
  func setRootViewController(_ viewController: UIViewController, animated: Bool)
}


//
//  Coordinator.swift
//
//
//  Created by Ramazan Ceylan on 12.09.2024.
//

import UIKit

protocol Coordinator: AnyObject {
  var router: Router { get set }
  var childCoordinators: [Coordinator] { get set }

  // Start the coordinator
  func start()

  // Add a child coordinator
  func addChild(_ coordinator: Coordinator)

  // Remove a child coordinator
  func removeChild(_ coordinator: Coordinator)
}

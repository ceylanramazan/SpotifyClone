//
//  GenericCoordinator.swift
//
//
//  Created by Ramazan Ceylan on 12.09.2024.
//

import UIKit
import Splash
import Login

class GenericCoordinator: BaseCoordinator<UIViewController> {

  var onFinish: (() -> Void)?

  init(router: Router, viewController: UIViewController) {
    super.init(router: router)
    self.viewController = viewController
  }

  override func start() {
    // Handle specific actions for each type of viewController if needed
    if let splashVC = viewController as? SplashViewController {
      splashVC.onSplashFinished = { [weak self] in
        self?.onFinish?()
      }
    } else if let loginVC = viewController as? LoginViewController {
      loginVC.onLoginSuccess = { [weak self] in
        self?.onFinish?()
      }
    }

    router.push(viewController!, animated: true)
  }
}

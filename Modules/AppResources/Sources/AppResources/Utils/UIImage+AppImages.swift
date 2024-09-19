//
//  UIImage+AppImages.swift
//
//
//  Created by Ramazan Ceylan on 13.09.2024.
//

import UIKit

public extension UIImage {

  // MARK: - Enum for App Images
  enum AppImages: String {
    case splash
  }

  // Function to retrieve the image using enum
  static func appImage(_ image: AppImages) -> UIImage? {
    return UIImage(named: image.rawValue, in: Bundle.module, compatibleWith: nil)
  }
}

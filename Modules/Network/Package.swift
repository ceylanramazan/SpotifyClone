// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Network",
  products: [
    .library(
      name: "Network",
      targets: ["Network"]),
  ],
  dependencies: [
    .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.4.0"),
    .package(path: "../Common")
  ],
  targets: [
    .target(
      name: "Network",
      dependencies: [
        "Alamofire",
        "Common"
      ]
    ),
    .testTarget(
      name: "NetworkTests",
      dependencies: ["Network"]
    ),
  ]
)

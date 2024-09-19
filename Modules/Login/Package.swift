// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Login",
  products: [
    .library(
      name: "Login",
      targets: ["Login"]),
  ],
  dependencies: [
    .package(path: "../Network")
  ],
  targets: [
    .target(
      name: "Login",
      dependencies: [
        "Network"
      ]
    ),
    .testTarget(
      name: "LoginTests",
      dependencies: ["Login"]),
  ]
)

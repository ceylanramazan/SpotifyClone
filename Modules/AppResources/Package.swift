// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "AppResources",
  products: [
    .library(
      name: "AppResources",
      targets: ["AppResources"]),
  ],
  dependencies: [
    .package(url: "https://github.com/onevcat/Kingfisher.git", .upToNextMajor(from: "7.0.0"))
  ],
  targets: [
    .target(
      name: "AppResources",
      dependencies: [
        "Kingfisher"
      ],
      resources: [
        .process("Resources")
      ]
    ),
    .testTarget(
      name: "AppResourcesTests",
      dependencies: ["AppResources"]),
  ]
)

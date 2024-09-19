// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

// Splash/Package.swift
import PackageDescription

let package = Package(
  name: "Splash",
  products: [
    .library(
      name: "Splash",
      targets: ["Splash"]),
  ],
  dependencies: [
    .package(path: "../Common"),
    .package(path: "../Network"),
    .package(path: "../AppResources")
  ],
  targets: [
    .target(
      name: "Splash",
      dependencies: [
        "Common",
        "Network",
        "AppResources"
      ]
    ),
    .testTarget(
      name: "SplashTests",
      dependencies: ["Splash"]),
  ]
)


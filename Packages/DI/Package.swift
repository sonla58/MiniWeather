// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DI",
    products: [
        .library(
            name: "DI",
            targets: ["DI"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "DI",
            dependencies: []),
    ]
)

// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WeatherRepository",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "WeatherRepository",
            targets: ["WeatherRepository"])
    ],
    dependencies: [
        .package(name: "Model", path: "../../Packages/Model"),
    ],
    targets: [
        .target(
            name: "WeatherRepository",
            dependencies: [
                .product(name: "Model", package: "Model"),
            ]),
        .testTarget(
            name: "WeatherRepositoryTests",
            dependencies: ["WeatherRepository"]),
    ]
)

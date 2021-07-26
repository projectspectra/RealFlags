// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "IndomioFlags",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "IndomioFlags", targets: ["IndomioFlags"]),
        .library(name: "IndomioFlagsFirebase", targets: ["IndomioFlagsFirebase"])
    ],
    dependencies: [
        .package(
            name: "Firebase",
            url: "https://github.com/firebase/firebase-ios-sdk.git",
            from: "7.0.0"
        )
    ],
    targets: [
        .target(
            name: "IndomioFlags",
            dependencies: [],
            path: "IndomioFlags/Sources"
        ),
        .target(
            name: "IndomioFlagsFirebase",
            dependencies: [
                "IndomioFlags",
                .product(name: "FirebaseRemoteConfig", package: "Firebase"),
            ],
            path: "IndomioFlagsFirebase/Sources"
        ),
        .testTarget(
            name: "IndomioFlagsTests",
            dependencies: ["IndomioFlags"]),
    ]
)

// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LetterAvatarKit",
    platforms: [
        .iOS(.v9),
        .tvOS(.v9)
    ],
    products: [
        .library(
            name: "LetterAvatarKit",
            targets: ["LetterAvatarKit"]
        ),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "LetterAvatarKit",
            dependencies: [],
            path: "LetterAvatarKit"
        ),
        .testTarget(
            name: "LetterAvatarKitTests",
            dependencies: [],
            path: "LetterAvatarKitTests"
        )
    ]
)

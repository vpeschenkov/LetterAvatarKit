// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LetterAvatarKit",
    platforms: [
        .iOS(.v12),
        .tvOS(.v12)
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
            dependencies: ["LetterAvatarKit"],
            path: "LetterAvatarKitTests",
            exclude: ["Info.plist"],
            resources: [.process("Resources")]
        )
    ]
)

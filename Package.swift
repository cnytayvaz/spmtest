// swift-tools-version: 5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AppConnect",
    platforms: [.iOS(.v9)],
    products: [
        .library(
            name: "AppConnect",
            targets: ["AppConnect"]),
        .library(
            name: "ConnectSnapshot",
            targets: ["ConnectSnapshot"])
    ],
    targets: [
        .binaryTarget(
            name: "AppConnect", 
            resources: "release/AppConnect.xcframework"
        ),
        .binaryTarget(
            name: "ConnectSnapshot", 
            resources: "Sub/ConnectSnapshot.xcframework"
            )
    ]
)
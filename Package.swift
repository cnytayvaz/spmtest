// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AppConnect",
    platforms: [.iOS(.v11)],
    products: [
        .library(
            name: "AppConnect",
            targets: ["AppConnect"]),
        .library(
            name: "ConnectSnapshot",
            targets: ["./ConnectSnapshotWrapper"])
    ],
    targets: [
        .binaryTarget(
            name: "AppConnect", 
            path: "release/AppConnect.xcframework"
        ),
        .binaryTarget(
            name: "ConnectSnapshot",
            path: "Sub/ConnectSnapshot.xcframework"
        ),
        .target(
            name: "ConnectSnapshotWrapper",
            dependencies: [
                .target(name: "AppConnect"),
                .target(name: "ConnectSnapshot")
            ]
        )
    ]
)

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
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
    ],
    targets: [
        .binaryTarget(name: "AppConnect", path: "release/AppConnect.xcframework")
    ]
)





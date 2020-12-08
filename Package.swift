// swift-tools-version:5.3

import PackageDescription

let package = Package(name: "SwiftyUtils",
                      platforms: [.macOS(.v10_10),
                                  .iOS(.v10),
                                  .tvOS(.v9),
                                  .watchOS(.v3)],
                      products: [.library(name: "SwiftyUtils", targets: ["SwiftyUtils"])],
                      targets: [.target(name: "SwiftyUtils", path: "Sources"),
                                .testTarget(name: "SwiftyUtilsTests", dependencies: ["SwiftyUtils"], path: "Tests")])

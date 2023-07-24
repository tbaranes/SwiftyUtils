// swift-tools-version:5.8

import PackageDescription

let testResources: [Resource]
let exclude: [String]
#if os(iOS)
testResources = [.process("Vendors/UIKit Nibs")]
exclude = []
#else
testResources = []
exclude = ["Vendors/UIKit Nibs"]
#endif

let package = Package(
	name: "SwiftyUtils",
	platforms: [
		.macOS(.v10_13),
		.iOS(.v11),
		.tvOS(.v11),
		.watchOS(.v4)
	],
	products: [
		.library(
			name: "SwiftyUtils",
			targets: ["SwiftyUtils"])
	],
	targets: [
		.target(
			name: "SwiftyUtils",
			path: "Sources",
			swiftSettings: [
				.enableUpcomingFeature("BareSlashRegexLiterals")
			]),
		.testTarget(
			name: "SwiftyUtilsTests",
			dependencies: [
				"SwiftyUtils"
			],
			path: "Tests",
			exclude: exclude,
			resources: testResources)
	])

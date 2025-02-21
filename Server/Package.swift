// swift-tools-version: 6.0

import PackageDescription

let package = Package(
		name: "Server",
		platforms: [.macOS(.v14), .iOS(.v17), .tvOS(.v17)],
		products: [
				.executable(name: "Server", targets: ["Server"]),
		],
		dependencies: [
				.package(url: "https://github.com/hummingbird-project/hummingbird.git", from: "2.0.0"),
				.package(url: "https://github.com/apple/swift-argument-parser.git", from: "1.3.0")
		],
		targets: [
				.executableTarget(name: "Server",
						dependencies: [
								.product(name: "ArgumentParser", package: "swift-argument-parser"),
								.product(name: "Hummingbird", package: "hummingbird"),
						],
						path: "Sources/Server"
				),
				.testTarget(name: "ServerTests",
						dependencies: [
								.byName(name: "Server"),
								.product(name: "HummingbirdTesting", package: "hummingbird")
						],
						path: "Tests/ServerTests"
				)
		]
)

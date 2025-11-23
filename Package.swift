// swift-tools-version: 6.0

import PackageDescription

let package = Package(
  name: "AdventOfCode2015",
  platforms: [.macOS(.v13)],
  products: [
    .executable(name: "AdventOfCode2015", targets: ["AdventOfCode2015"])
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-argument-parser.git", from: "1.3.0")
  ],
  targets: [
    .executableTarget(
      name: "AdventOfCode2015",
      dependencies: [.product(name: "ArgumentParser", package: "swift-argument-parser")],
      resources: [.copy("Inputs")]
    ),
    .testTarget(
      name: "AdventOfCode2015Tests",
      dependencies: ["AdventOfCode2015"]
    )
  ]
)

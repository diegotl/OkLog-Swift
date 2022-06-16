// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "OkLog",
//    platforms: [
//        .macOS(.v10_12),
//        .iOS(.v12)
//    ],
    products: [
        .library(name: "OkLog", targets: ["OkLog"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-protobuf.git", .upToNextMajor(from: "1.19.0")),
        .package(url: "https://github.com/1024jp/GzipSwift.git", .upToNextMajor(from: "5.2.0")),
        .package(url: "https://github.com/apple/swift-log.git", .upToNextMajor(from: "1.4.2"))
    ],
    targets: [
        .target(name: "OkLog", dependencies: ["SwiftProtobuf", "Gzip", "Logging"], path: "Sources"),
        .testTarget(name: "OkLogTests", dependencies: ["OkLog"]),
    ]
)

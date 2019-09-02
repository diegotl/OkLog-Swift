// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "OkLog",
    products: [
        .library(name: "OkLog", targets: ["OkLog"]),
        .library(name: "OkLogAlamofire", targets: ["OkLogAlamofire"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "4.1.0")),
        .package(url: "https://github.com/apple/swift-protobuf.git", .upToNextMajor(from: "1.6.0")),
        .package(url: "https://github.com/1024jp/GzipSwift.git", .upToNextMajor(from: "5.0.0")),
    ],
    targets: [
        .target(name: "OkLog", dependencies: ["SwiftProtobuf", "Gzip"], path: "Sources/Core", exclude: ["Protos", "Example"]),
        .target(name: "OkLogAlamofire", dependencies: ["OkLog", "Alamofire"], path: "Sources/Alamofire", exclude: ["Protos", "Example"]),
    ]
)

// swift-tools-version:5.7

import PackageDescription

let version = "1.26.0-pull-request-2e547e90a53aa07286cb5636cb9eee2fddf487e6"
let repo = "ContentSquare/CSSwiftProtobuf"
let checksum = "8d7eeb6e8132308633de75942572d11631535118059b41899263e42f03dde229"

let binaryTarget : Target

if repo.isEmpty || checksum.isEmpty || version.isEmpty {
    binaryTarget = .binaryTarget(
        name: "CSSwiftProtobuf",
        path: "CSSwiftProtobuf.xcframework"
    )
} else {
    binaryTarget = .binaryTarget(
        name: "CSSwiftProtobuf",
        url: "https://github.com/\(repo)/releases/download/\(version)/package.zip",
        checksum: checksum
    )
}

let package = Package(
    name: "CSSwiftProtobuf",
    platforms: [
        .macOS(.v10_14),
        .iOS(.v12),
        .watchOS(.v5),
        .tvOS(.v13),
    ],
    products: [
        .library(
            name: "CSSwiftProtobufWrapper",
            targets: ["CSSwiftProtobufWrapper"]
        ),
    ],
    targets: [
        binaryTarget,
        .target(
            name: "CSSwiftProtobufWrapper",
            dependencies: ["CSSwiftProtobuf"]
        )
    ],
    swiftLanguageVersions: [.v5]
)

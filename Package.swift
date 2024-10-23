// swift-tools-version:5.7

import PackageDescription

let version = "1.26.0-pull-request-3cfcf69463a56085762cdcf8a377e38302d219a8"
let repo = "ContentSquare/CSSwiftProtobuf"
let checksum = "d701949e3470586ccf3048864dc3c70a711d339deb7b465ea255d93f03cc1b63"

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
        .macOS(.v11),
        .iOS(.v12),
        .watchOS(.v5),
        .tvOS(.v12),
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

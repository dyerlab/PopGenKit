
import PackageDiscription


let package = Package(
    name: "PopgenKit",
    platforms: [
        .macOS(.v10_14),
    ],
    products: [
        .library(name: "PopgenKit", targets: ["PopgenKit"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "PopgenKit", dependencies: []),
        .testTarget(name: "PopgenKitTests", dependencies: []),
    ]
)


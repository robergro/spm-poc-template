// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Spark___COMPONENT_NAME___",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "Spark___COMPONENT_NAME___",
            targets: ["Spark___COMPONENT_NAME___"]
        ),
        .library(
            name: "Spark___COMPONENT_NAME___Testing",
            targets: ["Spark___COMPONENT_NAME___Testing"]
        )
    ],
    dependencies: [
        // Git
       .package(
           url: "https://github.com/robergro/spm-poc-common.git",
           branch: "main"
       ),
       .package(
           url: "https://github.com/robergro/spm-poc-theming.git",
           branch: "main"
       ),

        // Local
        // .package(
        //     path: "../spm-poc-common"
        // ),
        // .package(
        //     path: "../spm-poc-theming"
        // )
    ],
    targets: [
        .target(
            name: "Spark___COMPONENT_NAME___",
            dependencies: [
                .product(
                    name: "SparkInternal",
                    package: "spm-poc-common"
                ),
                .product(
                    name: "SparkTheming",
                    package: "spm-poc-theming"
                )
            ]
        ),
        .target(
            name: "Spark___COMPONENT_NAME___Testing",
            dependencies: [
                "Spark___COMPONENT_NAME___",
                .product(
                    name: "SparkInternal",
                    package: "spm-poc-common"
                ),
                .product(
                    name: "SparkInternalTesting",
                    package: "spm-poc-common"
                ),
                .product(
                    name: "SparkThemingTesting",
                    package: "spm-poc-theming"
                ),
                .product(
                    name: "SparkTheme",
                    package: "spm-poc-theming"
                )
            ]
        ),
        .testTarget(
            name: "Spark___COMPONENT_NAME___UnitTests",
            dependencies: [
                "Spark___COMPONENT_NAME___",
                "Spark___COMPONENT_NAME___Testing",
                .product(
                    name: "SparkInternalTesting",
                    package: "spm-poc-common"
                ),
                .product(
                    name: "SparkThemingTesting",
                    package: "spm-poc-theming"
                )
            ]
        ),
        .testTarget(
            name: "Spark___COMPONENT_NAME___SnapshotTests",
            dependencies: [
                "Spark___COMPONENT_NAME___",
                "Spark___COMPONENT_NAME___Testing",
                .product(
                    name: "SparkInternalSnapshotTesting",
                    package: "spm-poc-common"
                ),
            ]
        ),
    ]
)

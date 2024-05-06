// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SparkYOUR_COMPONENT",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "SparkYOUR_COMPONENT",
            targets: ["SparkYOUR_COMPONENT"]
        ),
        .library(
            name: "SparkYOUR_COMPONENTTesting",
            targets: ["SparkYOUR_COMPONENTTesting"]
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
            name: "SparkYOUR_COMPONENT",
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
            name: "SparkYOUR_COMPONENTTesting",
            dependencies: [
                "SparkYOUR_COMPONENT",
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
            name: "SparkYOUR_COMPONENTUnitTests",
            dependencies: [
                "SparkYOUR_COMPONENT",
                "SparkYOUR_COMPONENTTesting",
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
            name: "SparkYOUR_COMPONENTSnapshotTests",
            dependencies: [
                "SparkYOUR_COMPONENT",
                "SparkYOUR_COMPONENTTesting",
                .product(
                    name: "SparkInternalSnapshotTesting",
                    package: "spm-poc-common"
                ),
            ]
        ),
    ]
)

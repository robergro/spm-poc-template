//
//  YOUR_COMPONENTUIViewSnapshotTests.swift
//  SPARKYOUR_COMPONENTTests
//
//  Created by YOUR_NAME on CURRENT_DATE.
//  Copyright © CURRENT_YEAR Adevinta. All rights reserved.
//

import XCTest
@testable import SparkTheme
@testable import SparkTheming
@_spi(SI_SPI) @testable import SparkInternal
@_spi(SI_SPI) @testable import SparkInternalTesting
@_spi(SI_SPI) @testable import SparkInternalSnapshotTesting

@testable import SparkYOUR_COMPONENT

final class YOUR_COMPONENTUIViewSnapshotTests: UIKitComponentSnapshotTestCase {

    // MARK: - Properties

    private let theme: Theme = SparkTheme.shared

    // MARK: - Tests

    func test() {
        let scenarios = YOUR_COMPONENTScenarioSnapshotTests.allCases

        for scenario in scenarios {
            let configurations = scenario.configuration(isSwiftUIComponent: false)
            for configuration in configurations {

                var view = YOUR_COMPONENTUIView(
                        theme: self.theme,
                        intent: configuration.intent
                )
                view.translatesAutoresizingMaskIntoConstraints = false

                self.assertSnapshot(
                    matching: view,
                    modes: configuration.modes,
                    sizes: configuration.sizes,
                    testName: configuration.testName()
                )
            }
        }
    }
}

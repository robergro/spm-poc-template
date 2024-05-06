//
//  YOUR_COMPONENTViewSnapshotTests.swift
//  SPARKYOUR_COMPONENTTests
//
//  Created by YOUR_NAME on CURRENT_DATE.
//  Copyright © CURRENT_YEAR Adevinta. All rights reserved.
//

import XCTest
import SwiftUI
@testable import SparkTheme
@testable import SparkTheming
@_spi(SI_SPI) @testable import SparkInternal
@_spi(SI_SPI) @testable import SparkInternalTesting
@_spi(SI_SPI) @testable import SparkInternalSnapshotTesting

@testable import SparkYOUR_COMPONENT

final class YOUR_COMPONENTViewSnapshotTests: SwiftUIComponentSnapshotTestCase {

    // MARK: - Properties

    private let theme: Theme = SparkTheme.shared

    // MARK: - Tests

    func test() {
        let scenarios = YOUR_COMPONENTScenarioSnapshotTests.allCases

        for scenario in scenarios {
            let configurations = scenario.configuration(isSwiftUIComponent: true)
            for configuration in configurations {
                let view = YOUR_COMPONENTView(
                    theme: self.theme,
                    intent: configuration.intent,
                    variant: configuration.variant
                )
                    .iconImage(configuration.iconImage?.rightValue)
                    .text(configuration.text)
                    .frame(width: configuration.width)
                    .fixedSize()

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

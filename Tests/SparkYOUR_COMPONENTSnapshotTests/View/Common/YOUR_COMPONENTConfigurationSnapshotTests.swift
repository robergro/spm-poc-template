//
//  YOUR_COMPONENTConfigurationSnapshotTests.swift
//  SPARKYOUR_COMPONENTTests
//
//  Created by YOUR_NAME on CURRENT_DATE.
//  Copyright © CURRENT_YEAR Adevinta. All rights reserved.
//

import UIKit
@testable import SparkYOUR_COMPONENT
@_spi(SI_SPI) @testable import SparkInternal
@_spi(SI_SPI) @testable import SparkInternalSnapshotTesting

struct YOUR_COMPONENTConfigurationSnapshotTests {

    // MARK: - Properties

    let scenario: YOUR_COMPONENTScenarioSnapshotTests

    let intent: YOUR_COMPONENTIntent
    let variant: YOUR_COMPONENTVariant
    let iconImage: ImageEither?
    let text: String?
    let isLongText: Bool
    var width: CGFloat? {
        return self.isLongText ? 100 : nil
    }
    let modes: [ComponentSnapshotTestMode]
    let sizes: [UIContentSizeCategory]

    // MARK: - Getter

    func testName() -> String {
        return [
            "\(self.scenario.rawValue)",
            "\(self.intent)",
            "\(self.variant)",
            self.iconImage != nil ? "withImage" : "withoutImage",
            self.text != nil ? (self.isLongText ? "longText" : "normalText") : "withoutText"
        ].joined(separator: "-")
    }
}

//
//  YOUR_COMPONENTScenarioSnapshotTestsTests.swift
//  SPARKYOUR_COMPONENTSnapshotTests
//
//  Created by YOUR_NAME on CURRENT_DATE.
//  Copyright © CURRENT_YEAR Adevinta. All rights reserved.
//

@testable import SparkYOUR_COMPONENT
@_spi(SI_SPI) @testable import SparkInternalTesting
@_spi(SI_SPI) @testable import SparkInternalSnapshotTesting
import UIKit
import SwiftUI

enum YOUR_COMPONENTScenarioSnapshotTests: String, CaseIterable {
    case test1
    case test2
    case test3
    case test4
    case test5

    // MARK: - Type Alias

    typealias Constants = ComponentSnapshotTestConstants

    // MARK: - Configurations

    func configuration(isSwiftUIComponent: Bool) -> [YOUR_COMPONENTConfigurationSnapshotTests] {
        switch self {
        case .test1:
            return self.test1(isSwiftUIComponent: isSwiftUIComponent)
        case .test2:
            return self.test2(isSwiftUIComponent: isSwiftUIComponent)
        case .test3:
            return self.test3(isSwiftUIComponent: isSwiftUIComponent)
        case .test4:
            return self.test4(isSwiftUIComponent: isSwiftUIComponent)
        case .test5:
            return self.test5(isSwiftUIComponent: isSwiftUIComponent)
        }
    }

    // MARK: - Scenarios

    /// Test 1
    ///
    /// Description: TODO:
    ///
    /// Content:
    ///  - TODO: 
    private func test1(isSwiftUIComponent: Bool) -> [YOUR_COMPONENTConfigurationSnapshotTests] {
        let intents = YOUR_COMPONENTIntent.allCases

        return intents.map {
            .init(
                scenario: self,
                intent: $0,
                variant: .tinted,
                iconImage: .mock(isSwiftUIComponent: isSwiftUIComponent),
                text: "Text",
                isLongText: false,
                modes: Constants.Modes.all,
                sizes: Constants.Sizes.default
            )
        }
    }
}

//
//  YOUR_COMPONENTViewModel.swift
//  SPARKYOUR_COMPONENT
//
//  Created by YOUR_NAME on CURRENT_DATE.
//  Copyright © CURRENT_YEAR Adevinta. All rights reserved.
//

import SwiftUI
import SparkTheming

final class YOUR_COMPONENTViewModel: ObservableObject {

    // MARK: - Public properties

    // TODO: If Needed

    // MARK: - Private properties

    private let theme: Theme
    private var intent: YOUR_COMPONENTIntent

    // MARK: - Initialization

    init(
        theme: Theme,
        intent: YOUR_COMPONENTIntent = .main
    ) {
        self.theme = theme
        self.intent = intent
    }

    // MARK: - Setter

    // TODO: If Needed

    // MARK: - Getter

    // TODO: If Needed
}

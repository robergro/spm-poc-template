//
//  YOUR_COMPONENTView.swift
//  SPARKYOUR_COMPONENT
//
//  Created by YOUR_NAME on CURRENT_DATE.
//  Copyright © CURRENT_YEAR Adevinta. All rights reserved.
//

import SwiftUI
import SparkTheming
@_spi(SI_SPI) import SparkInternal

/// The SwiftUI version for the your_component
public struct YOUR_COMPONENTView: View {

    // MARK: - Type Alias

    private typealias AccessibilityIdentifier = YOUR_COMPONENTAccessibilityIdentifier

    // MARK: - Private Properties

    @ObservedObject private var viewModel: YOUR_COMPONENTViewModel
    @ScaledMetric private var height: CGFloat = YOUR_COMPONENTConstants.height
    @ScaledMetric private var smallSpacing: CGFloat
    @ScaledMetric private var mediumSpacing: CGFloat

    // MARK: - Initialization

    /// Initialize a new your_component with default values.
    /// - Parameters:
    ///   - theme: The spark theme.
    ///   - intent: The intent of the your_component.
    ///   - variant: The variant of the your_component.
    ///
    /// - Note: You must use the Modifier to add at least iconImage or/and text.
    public init(
        theme: Theme,
        intent: YOUR_COMPONENTIntent,
        variant: YOUR_COMPONENTVariant
    ) {
        let viewModel = YOUR_COMPONENTViewModel(
            theme: theme,
            intent: intent,
            variant: variant
        )
        self.viewModel = viewModel

        self._smallSpacing = .init(wrappedValue: viewModel.spacing.small)
        self._mediumSpacing = .init(wrappedValue: viewModel.spacing.medium)
    }

    // MARK: - View

    public var body: some View {
        HStack(spacing: self.smallSpacing) {
            // Optional icon image
            self.viewModel.iconImage?
                .resizable()
                .scaledToFit()
                .foregroundColor(self.viewModel.colors.foregroundColor.color)
                .accessibilityIdentifier(AccessibilityIdentifier.iconImage)

            // Optional Text
            if let text = self.viewModel.text {
                Text(text)
                    .lineLimit(1)
                    .font(self.viewModel.typography.captionHighlight.font)
                    .truncationMode(.tail)
                    .foregroundColor(self.viewModel.colors.foregroundColor.color)
                    .accessibilityIdentifier(AccessibilityIdentifier.text)
            }
        }
        .padding(.init(vertical: self.smallSpacing,
                       horizontal: self.mediumSpacing))
        .frame(height: self.height)
        .background(self.viewModel.colors.backgroundColor.color)
        .border(width: self.viewModel.border.width.small,
                radius: self.viewModel.border.radius.full,
                colorToken: self.viewModel.colors.borderColor)
    }

    // MARK: - Modifier

    /// Add the some accessibility values on your_component.
    /// - Parameters:
    ///   - identifier: The accessibility identifier.
    ///   - label: The label identifier. If value is nil and text is set, the label identifier will be the text value.
    /// - Returns: Current YOUR_COMPONENT View.
    public func accessibility(identifier: String,
                              label: String? = nil) -> some View {
        self.modifier(AccessibilityViewModifier(identifier: identifier,
                                                label: label ?? self.viewModel.text))
    }

    /// Set the intent on your_component.
    /// - Parameters:
    ///   - intent: The intent of the your_component.
    /// - Returns: Current YOUR_COMPONENT View.
    @available(*, deprecated, message: "Intent is now directly on the init")
    public func intent(_ intent: YOUR_COMPONENTIntent) -> Self {
        self.viewModel.setIntent(intent)
        return self
    }

    /// Set the variant on your_component.
    /// - Parameters:
    ///   - variant: The variant of the your_component.
    /// - Returns: Current YOUR_COMPONENT View.
    @available(*, deprecated, message: "Variant is now directly on the init")
    public func variant(_ variant: YOUR_COMPONENTVariant) -> Self {
        self.viewModel.setVariant(variant)
        return self
    }

    /// Set the iconImage on your_component.
    /// - Parameters:
    ///   - iconImage: The icon image of the your_component.
    /// - Nullability:
    ///   - The image can be nil, in this case, no image is displayed.
    ///   - If the image is nil, **a text must be added**.
    /// - Returns: Current YOUR_COMPONENT View.
    public func iconImage(_ iconImage: Image?) -> Self {
        self.viewModel.setIconImage(iconImage)
        return self
    }

    /// Set the text of the your_component.
    /// - Parameters:
    ///   - text: The text of the your_component. Can be nil.
    /// - Nullability:
    ///   - The text can be nil, in this case, no text is displayed.
    ///   - If the text is nil, **an iconImage must be added**.
    /// - Returns: Current YOUR_COMPONENT View.
    public func text(_ text: String?) -> Self {
        self.viewModel.setText(text)
        return self
    }
}

//
//  YOUR_COMPONENTUIView.swift
//  SPARKYOUR_COMPONENT
//
//  Created by YOUR_NAME on CURRENT_DATE.
//  Copyright © CURRENT_YEAR Adevinta. All rights reserved.
//

import UIKit
import SparkTheming
@_spi(SI_SPI) import SparkInternal

/// The UIKit version for the your_component.
public final class YOUR_COMPONENTUIView: UIView {

    // MARK: - Components

    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView(
            arrangedSubviews:
                [
                    self.textLabel
                ])
        stackView.axis = .horizontal
        return stackView
    }()

    private var textLabel: UILabel = {
        let label = UILabel()
        label.text = "YOUR_COMPONENT"
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        label.adjustsFontForContentSizeCategory = true
        label.accessibilityIdentifier = AccessibilityIdentifier.text
        label.setContentCompressionResistancePriority(.required,
                                                      for: .vertical)
        label.setContentCompressionResistancePriority(.required,
                                                      for: .horizontal)
        return label
    }()

    // MARK: - Public Properties

    /// The spark theme of the your_component.
    public var theme: Theme {
        didSet {
            // TODO: If needed
        }
    }

    /// The intent of the your_component.
    public var intent: YOUR_COMPONENTIntent {
        didSet {
            // TODO: If needed
        }
    }

    // MARK: - Private Properties

    // TODO: If needed

    // MARK: - Initialization

    /// Initialize a new your_component view.
    /// - Parameters:
    ///   - theme: The spark theme of the your_component.
    ///   - intent: The intent of the your_component.
    public convenience init(
        theme: Theme,
        intent: YOUR_COMPONENTIntent
    ) {
        self.init(
            theme,
            intent: intent
        )
    }

    private init(
        _ theme: Theme,
        intent: YOUR_COMPONENTIntent
    ) {
        self.theme = theme
        self.intent = intent

        super.init(frame: .zero)

        self.setupView()
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    // MARK: - View setup

    private func setupView() {
        // Add subview
        self.addSubview(self.contentStackView)
        
        // Setup constraints
        self.setupConstraints()
        
        // Setup publisher subcriptions
        self.setupSubscriptions()
    }

    // MARK: - Layout

    public override func layoutSubviews() {
        super.layoutSubviews()

        // TODO: If Needed
    }

    // MARK: - Constraints

    private func setupConstraints() {
        self.setupViewConstraints()
        
        // TODO: If Needed
    }

    private func setupViewConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false

        // TODO: If Needed
    }

    // MARK: - Subscribe

    /// Subscribe to the published properties on ViewModel.
    /// This method is internal because it can be overriden by the view that inherits from this class.
    internal func setupSubscriptions() {
        // TODO: If Needed
    }

    // MARK: - Trait Collection

    public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        // TODO: If Needed
    }
}
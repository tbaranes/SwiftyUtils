//
//  UIElementPreview.swift
//  SwiftyUtils
//
//  Created by Tom Baranes on 25/04/2020.
//  Copyright © 2020 Tom Baranes. All rights reserved.
//
// Inspiration from: https://www.avanderlee.com/swiftui/previews-different-states/
//

#if (arch(arm64) || arch(x86_64))
import SwiftUI

/// Generate multiple previews configured, the different preview configurations are documented below.
/// - Note:
/// - Default sized preview or dedicated preview device
/// - A preview with Dark Mode enabled
/// - Each localization of our project applied to a preview
/// - Different dynamic type sizes applied
@available(iOS 13.0, tvOS 13.0, watchOSApplicationExtension 6.0, OSX 10.15, *)
public struct UIElementPreview<Value: View>: View {

    private let previewLayout: PreviewLayout
    private let previewDevices: [String]
    private let dynamicTypeSizes: [ContentSizeCategory]

    /// Filter out "base" to prevent a duplicate preview.
    private let localizations = Bundle.main.localizations.map(Locale.init).filter { $0.identifier != "base" }
    private let viewToPreview: Value

    /// Generate automatically multiple previews including
    /// - Parameters:
    ///   - viewToPreview: The view to preview
    ///   - previewLayout: The preview layout configuration, it must be either `.sizeThatFits`or `.device`.
    ///                    Default is `.device`.
    ///   - previewDevices: A list of the devices to preview when `previewLayout` is equal to `.device`.
    ///                     Default is `["iPhone SE", "iPhone XS Max"]`.
    ///   - dynamicTypeSizes: The different dynamic type sizes applied to our preview
    /// - returns: a `View` used to display all previews
    public init(_ viewToPreview: Value,
                previewLayout: PreviewLayout = .device,
                previewDevices: [String] = ["iPhone SE", "iPhone XS Max"],
                dynamicTypeSizes: [ContentSizeCategory] = [.extraSmall, .large, .extraExtraExtraLarge]) {
        self.viewToPreview = viewToPreview
        self.previewLayout = previewLayout
        self.previewDevices = previewDevices
        self.dynamicTypeSizes = dynamicTypeSizes
    }

    public var body: some View {
        Group {
            if self.isPreviewSizeThatFits {
                previews(named: "Default Device", previewLayout: .sizeThatFits)
            } else {
                ForEach(previewDevices, id: \.self) {
                    self.previews(named: $0, previewLayout: .device)
                }
            }
        }
    }

    private var isPreviewSizeThatFits: Bool {
        switch previewLayout {
        case .device:
            return false
        case .sizeThatFits:
            return true
        default:
            fatalError("`\(previewLayout)` size is not handled by `UIElementPreview`")
        }
    }

    private func previews(named previewName: String, previewLayout: PreviewLayout) -> some View {
        // swiftlint:disable:next closure_body_length
        Group {
            self.viewToPreview
                .previewLayout(previewLayout)
                .previewDevice(PreviewDevice(rawValue: previewName))
                .previewDisplayName("\(previewName)")

            self.viewToPreview
                .previewLayout(previewLayout)
                .environment(\.colorScheme, .dark)
                .previewDevice(PreviewDevice(rawValue: previewName))
                .previewDisplayName("\(previewName) Dark Mode")

            ForEach(localizations, id: \.identifier) { locale in
                self.viewToPreview
                    .previewLayout(previewLayout)
                    .environment(\.locale, locale)
                    .previewDevice(PreviewDevice(rawValue: previewName))
                    .previewDisplayName(Locale.current.localizedString(forIdentifier: locale.identifier))
            }

            ForEach(dynamicTypeSizes, id: \.self) { sizeCategory in
                self.viewToPreview
                    .previewLayout(previewLayout)
                    .environment(\.sizeCategory, sizeCategory)
                    .previewDevice(PreviewDevice(rawValue: previewName))
                    .previewDisplayName("\(previewName) \(sizeCategory)")
            }
        }
    }
}
#endif

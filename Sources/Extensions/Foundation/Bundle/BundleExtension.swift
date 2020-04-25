//
//  Created by Tom Baranes on 24/04/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import Foundation

// MARK: - App Information

extension Bundle {

    /// The app name extracted from the `infoDictionary`.
    /// - Returns: String.
    public var appName: String {
        string(for: kCFBundleNameKey as String)
    }

    /// The app version extracted from the `infoDictionary`.
    /// - Returns: String.
    @objc public var appVersion: String {
        string(for: "CFBundleShortVersionString")
    }

    /// The display name extracted from the `infoDictionary`.
    /// - Returns: String.
    public var displayName: String {
        string(for: "CFBundleDisplayName")
    }

    /// The app build extracted from the `infoDictionary`.
    /// - Returns: String.
    public var appBuild: String {
        string(for: kCFBundleVersionKey as String)
    }

    /// The app bundle identifier extracted from the `infoDictionary`.
    /// - Returns: String.
    public var bundleId: String {
        string(for: "CFBundleIdentifier")
    }

}

// MARK: - Status

extension Bundle {

    /// Check either the app has been installed using TestFlight.
    /// - Returns: Bool.
    public var isInTestFlight: Bool {
        appStoreReceiptURL?.path.contains("sandboxReceipt") == true
    }

}

// MARK: - Schemes

extension Bundle {

    public var schemes: [String] {
        guard let infoDictionary = Bundle.main.infoDictionary,
            let urlTypes = infoDictionary["CFBundleURLTypes"] as? [AnyObject],
            let urlType = urlTypes.first as? [String: AnyObject],
            let urlSchemes = urlType["CFBundleURLSchemes"] as? [String] else {
                return []
        }
        return urlSchemes
    }

    public var mainScheme: String? {
        schemes.first
    }

}

// MARK: - Internal

extension Bundle {

    private func string(for key: String) -> String {
        guard let infoDictionary = Bundle.main.infoDictionary,
            let value = infoDictionary[key] as? String else {
                return ""
        }
        return value
    }

}

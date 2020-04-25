//
//  Created by Tom Baranes on 24/04/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import Foundation

// MARk: - Getter

extension FileManager {

    /// The app's `Document` directory in the file system.
    /// - Returns: URL.
    @objc public static var document: URL {
        self.default.document
    }

    /// The app's `Document` directory in the file system.
    /// - Returns: URL.
    @objc public var document: URL {
        #if os(OSX)
            // On OS X it is, so put files in Application Support. If we aren't running
            // in a sandbox, put it in a subdirectory based on the bundle identifier
            // to avoid accidentally sharing files between applications
            var defaultURL = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask).first
            if ProcessInfo.processInfo.environment["APP_SANDBOX_CONTAINER_ID"] == nil {
                var identifier = Bundle.main.bundleIdentifier
                if identifier?.isEmpty ?? false {
                    identifier = Bundle.main.executableURL?.lastPathComponent
                }
                defaultURL = defaultURL?.appendingPathComponent(identifier ?? "", isDirectory: true)
            }
            return defaultURL ?? URL(fileURLWithPath: "")
        #else
            // On iOS the Documents directory isn't user-visible, so put files there
            return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        #endif
    }

}

// MARK: - Create

extension FileManager {

    /// Create a new directory at the specified URL.
    /// - Parameter directoryURL: a file URL where the directory will be created.
    /// - Note: if an error occurred during the creation, an error will be throw.
    public static func createDirectory(at directoryURL: URL) throws {
        try self.default.createDirectory(at: directoryURL)
    }

    /// Create a new directory at the specified URL.
    /// - Parameter directoryURL: a file URL where the directory will be created.
    /// - Note: if an error occurred during the creation, an error will be throw.
    @objc
    public func createDirectory(at directoryUrl: URL) throws {
        let fileManager = FileManager.default
        var isDir: ObjCBool = false
        let fileExists = fileManager.fileExists(atPath: directoryUrl.path, isDirectory: &isDir)
        if fileExists == false || isDir.boolValue != false {
            try fileManager.createDirectory(at: directoryUrl, withIntermediateDirectories: true, attributes: nil)
        }
    }

}

// MARK: - Remove

extension FileManager {

    /// Remove all the files found in the `Temporary` app directory.
    /// - Parameter path: a parameter that's not used, it will be removed in a future version.
    /// - Note: if an error occurred during the creation, an error will be throw.
    public static func removeTemporaryFiles(at path: String) throws {
        try self.default.removeTemporaryFiles()
    }

    /// Remove all the temporary files found in the `Temporary` app directory.
    /// - Note: if an error occurred during the creation, an error will be throw.
    public func removeTemporaryFiles() throws {
        let contents = try contentsOfDirectory(atPath: NSTemporaryDirectory())
        for file in contents {
            try removeItem(atPath: NSTemporaryDirectory() + file)
        }
    }

    /// Remove all the files files found in the `Document` app directory.
    /// - Parameter path: a parameter that's not used, it will be removed in a future version.
    /// - Note: if an error occurred during the creation, an error will be throw.
    public static func removeDocumentFiles(at path: String) throws {
        try self.default.removeDocumentFiles()
    }

    /// Remove all the files files found in the `Document` app directory.
    /// - Note: if an error occurred during the creation, an error will be throw.
    public func removeDocumentFiles() throws {
        let documentPath = document.path
        let contents = try contentsOfDirectory(atPath: documentPath)
        for file in contents {
            try removeItem(atPath: documentPath + file)
        }
    }
}

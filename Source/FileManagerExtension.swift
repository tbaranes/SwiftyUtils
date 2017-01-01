//
//  Created by Tom Baranes on 24/04/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import Foundation

// MARk: - Getter

public extension FileManager {

    public static var document: URL {
        return self.default.document
    }

    public var document: URL {
        #if os(OSX)
            // On OS X it is, so put files in Application Support. If we aren't running
            // in a sandbox, put it in a subdirectory based on the bundle identifier
            // to avoid accidentally sharing files between applications
            var defaultURL = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask).first
            if ProcessInfo.processInfo.environment["APP_SANDBOX_CONTAINER_ID"] == nil {
                var identifier = Bundle.main.bundleIdentifier
                if identifier?.length == 0 {
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

public extension FileManager {

    public static func createDirectory(at directoryURL: URL) throws {
        return try self.default.createDirectory(at: directoryURL)
    }

    public func createDirectory(at directoryUrl: URL) throws {
        let fileManager = FileManager.default
        var isDir: ObjCBool = false
        let fileExists = fileManager.fileExists(atPath: directoryUrl.path, isDirectory: &isDir)
        if fileExists == false || isDir.boolValue != false {
            try fileManager.createDirectory(at: directoryUrl, withIntermediateDirectories: true, attributes: nil)
        }
    }

}

// MARK: - Delete

public extension FileManager {

    public static func deleteAllTemporaryFiles(at path: String) throws {
        return try self.default.deleteAllTemporaryFiles()
    }

    public func deleteAllTemporaryFiles() throws {
        let contents = try contentsOfDirectory(atPath: NSTemporaryDirectory())
        for file in contents {
            try removeItem(atPath: NSTemporaryDirectory() + file)
        }
    }

    public static func deleteAllDocumentFiles(at path: String) throws {
        return try self.default.deleteAllDocumentFiles()
    }

    public func deleteAllDocumentFiles() throws {
        let documentPath = document.path
        let contents = try contentsOfDirectory(atPath: documentPath)
        for file in contents {
            try removeItem(atPath: documentPath + file)
        }
    }
}

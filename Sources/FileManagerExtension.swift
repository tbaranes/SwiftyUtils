// NSFileManagerExtension.swift
//
// Copyright (c) 2016 Tom Baranes
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import Foundation

// MARk: - Getter

public extension FileManager {
    
    public static func documentDirectory() -> NSURL {
        return self.default().documentDirectory()
    }
    
    public func documentDirectory() -> NSURL {
        #if os(OSX)
            // On OS X it is, so put files in Application Support. If we aren't running
            // in a sandbox, put it in a subdirectory based on the bundle identifier
            // to avoid accidentally sharing files between applications
            var defaultURL = FileManager.default().urlsForDirectory(.applicationSupportDirectory, inDomains: .userDomainMask).first
            if ProcessInfo.processInfo().environment["APP_SANDBOX_CONTAINER_ID"] == nil{
                var identifier = Bundle.main().bundleIdentifier
                if identifier?.length == 0 {
                    identifier = Bundle.main().executableURL?.lastPathComponent
                }
                defaultURL = try! defaultURL?.appendingPathComponent(identifier ?? "", isDirectory: true)
            }
            return defaultURL ?? NSURL()
        #else
            // On iOS the Documents directory isn't user-visible, so put files there
            return FileManager.default().urlsForDirectory(.documentDirectory, inDomains: .userDomainMask)[0]
        #endif
    }
    
}

// MARK: - Create

public extension FileManager {
    
    public static func createDirectory(at directoryURL: NSURL) throws {
        return try self.default().createDirectory(at: directoryURL)
    }
    
    public func createDirectory(at directoryURL: NSURL) throws {
        let fileManager = FileManager.default()
        var isDir: ObjCBool = false
        let fileExists = fileManager.fileExists(atPath: directoryURL.path!, isDirectory: &isDir)
        if fileExists == false || isDir {
            try fileManager.createDirectory(at: directoryURL as URL, withIntermediateDirectories: true, attributes: nil)
        }
    }
        
}

// MARK: - Delete

public extension FileManager {
    
    public static func deleteAllTemporaryFiles(path: String) throws {
        return try self.default().deleteAllTemporaryFiles()
    }
    
    public func deleteAllTemporaryFiles() throws {
        let contents = try contentsOfDirectory(atPath: NSTemporaryDirectory())
        for file in contents {
            try removeItem(atPath: NSTemporaryDirectory() + file)
        }
    }

    public static func deleteAllDocumentFiles(path: String) throws {
        return try self.default().deleteAllDocumentFiles()
    }
    
    public func deleteAllDocumentFiles() throws {
        let documentPath = documentDirectory().path ?? ""
        let contents = try contentsOfDirectory(atPath: documentPath)
        for file in contents {
            try removeItem(atPath: documentPath + file)
        }
    }
}

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

public extension NSFileManager {
    
    public static func documentDirectory() -> NSURL {
        return self.defaultManager().documentDirectory()
    }
    
    public func documentDirectory() -> NSURL {
        #if os(OSX)
            // On OS X it is, so put files in Application Support. If we aren't running
            // in a sandbox, put it in a subdirectory based on the bundle identifier
            // to avoid accidentally sharing files between applications
            var defaultURL = NSFileManager.defaultManager().URLsForDirectory(.ApplicationSupportDirectory, inDomains: .UserDomainMask).first
            if NSProcessInfo.processInfo().environment["APP_SANDBOX_CONTAINER_ID"] == nil{
                var identifier = NSBundle.mainBundle().bundleIdentifier
                if identifier?.length == 0 {
                    identifier = NSBundle.mainBundle().executableURL?.lastPathComponent
                }
                defaultURL = defaultURL?.URLByAppendingPathComponent(identifier ?? "", isDirectory: true)
            }
            return defaultURL ?? NSURL()
        #else
            // On iOS the Documents directory isn't user-visible, so put files there
            return NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0]
        #endif
    }
    
}

// MARK: - Create

public extension NSFileManager {
    
    public static func createDirectory(at directoryURL: NSURL) throws {
        return try self.defaultManager().createDirectory(at: directoryURL)
    }
    
    public func createDirectory(at directoryURL: NSURL) throws {
        let fileManager = NSFileManager.defaultManager()
        var isDir: ObjCBool = false
        let fileExists = fileManager.fileExistsAtPath(directoryURL.path!, isDirectory: &isDir)
        if fileExists == false || isDir {
            try fileManager.createDirectoryAtURL(directoryURL, withIntermediateDirectories: true, attributes: nil)
        }
    }
        
}

// MARK: - Delete

public extension NSFileManager {
    
    public static func deleteAllTemporaryFiles(path: String) throws {
        return try self.defaultManager().deleteAllTemporaryFiles()
    }
    
    public func deleteAllTemporaryFiles() throws {
        let contents = try contentsOfDirectoryAtPath(NSTemporaryDirectory())
        for file in contents {
            try removeItemAtPath(NSTemporaryDirectory() + file)
        }
    }

    public static func deleteAllDocumentFiles(path: String) throws {
        return try self.defaultManager().deleteAllDocumentFiles()
    }
    
    public func deleteAllDocumentFiles() throws {
        let documentPath = documentDirectory().path ?? ""
        let contents = try contentsOfDirectoryAtPath(documentPath)
        for file in contents {
            try removeItemAtPath(documentPath + file)
        }
    }
}

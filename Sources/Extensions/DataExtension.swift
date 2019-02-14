//
//  DataExtension.swift
//  SwiftyUtils iOS
//
//  Created by Michael Redig on 2/13/19.
//  Copyright © 2019 Tom Baranes. All rights reserved.
//

import Foundation

extension Data {

    /**
    Provides the data as a hex string with formatting options.
     
    - Parameter hexLeader: Boolean determining if the string should start with "0x"
    - Parameter spaces: Boolean determining if there should be spaces inserted every 8 characters
     
    - Returns: String with hex encoded data
     */
    public func toHexString(hexLeader: Bool = false, spaces: Bool = false) -> String {
        let count = self.count / MemoryLayout<UInt8>.stride

        var hexString = ""
        if hexLeader {
            hexString = "0x"
        }
        self.withUnsafeBytes { (bytes: UnsafePointer<UInt8>) in
            //swiftlint:disable identifier_name
            for i in 0..<count {
                if spaces && (i % 4) == 0 && i != 0 && i != (count - 1) {
                    hexString += " "
                }
                hexString += String(format: "%02X", bytes[i])
            }
            //swiftline:enable identifier_name
        }
        return hexString
    }
    
    /**
    Provides the data as an array of UInt8 bytes for easy manipulation.
     */
    public var bytesArray: [UInt8] {
        return toBytesArray()
    }
    
    private func toBytesArray() -> [UInt8] {
        let count = self.count / MemoryLayout<UInt8>.stride
        let array = self.withUnsafeBytes { (bytes: UnsafePointer<UInt8>) -> [UInt8] in
            var byteArray = [UInt8]()
            byteArray.reserveCapacity(count)
            for i in 0..<count {
                byteArray.append(bytes[i])
            }
            return byteArray
        }
        return array
    }

}

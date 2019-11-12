//
//  DataExtension.swift
//  SwiftyUtils iOS
//
//  Created by Michael Redig on 2/13/19.
//  Copyright © 2019 Tom Baranes. All rights reserved.
//

import Foundation

extension Data {

    // MARK: Initializers
    /**
     Initializes a new data object from a hex string

     - Parameter hexString: String in hexadecimal format. Can start with "0x" or
                            not and may have spaces.
                            Any illegal (non hex) characters or an odd number of legal characters will cause it to fail.
     */
    public init?(hexString: String) {
        let noSpaces = hexString.replacingOccurrences(of: "\\s", with: "", options: .regularExpression, range: nil)
        guard noSpaces.count.isMultiple(of: 2) else {
            return nil
        }

        let hexArray = noSpaces.split(intoChunksOf: 2)

        var byteArray = [UInt8]()
        byteArray.reserveCapacity(hexString.count)
        for substringByte in hexArray {
            guard substringByte != "0x" else {
                continue
            }
            guard let byte = UInt8(substringByte, radix: 16) else {
                return nil
            }
            byteArray.append(byte)
        }
        self = Data(byteArray)
    }

    // MARK: managable data
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

        self.withUnsafeBytes { bytes in
            for index in 0..<count {
                if spaces && (index % 4) == 0 && index != 0 && index != (count - 1) {
                    hexString += " "
                }
                hexString += String(format: "%02X", bytes[index])
            }
        }
        return hexString
    }

    /**
    Provides the data as an array of UInt8 bytes for easy manipulation.
     */
    public var bytesArray: [UInt8] {
        return Array(self)
    }
}

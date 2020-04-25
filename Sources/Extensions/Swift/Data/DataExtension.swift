//
//  DataExtension.swift
//  SwiftyUtils iOS
//
//  Created by Michael Redig on 2/13/19.
//  Copyright © 2019 Tom Baranes. All rights reserved.
//

import Foundation

// MARK: - Initializers

extension Data {

    /// Initializes a new data object from a hex string
    /// - Parameter hexString: String in hexadecimal format. Can start with "0x" or not and may have spaces.
    ///                        Any illegal (non hex) characters or an odd number
    ///                        of legal characters will cause it to fail.
    /// - Returns: the Data object created from the hex string, or nil if an occured occured.
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

}

// MARK: - Mapping

extension Data {

    // Returns a dictionnary from the json data
    /// - Parameter options: Options for reading the JSON data and creating the Dictionary object.
    ///                      Default value is empty.
    /// - Returns: A Dictionary object from the JSON data in data, or nil if an error occurs.
    public func toDictionary(options: JSONSerialization.ReadingOptions = []) throws -> [String: Any]? {
        let data = try JSONSerialization.jsonObject(with: self, options: options) as? [String: Any]
        return data
    }

}

// MARK: - Managable data

extension Data {

    /// Provides the data as a hex string with formatting options.
    /// - Parameters:
    ///   - hexLeader: Boolean determining if the string should start with "0x"
    ///   - spaces: Boolean determining if there should be spaces inserted every 8 characters
    /// - Returns: String with hex encoded data
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

    /// Provides the data as an array of UInt8 bytes for easy manipulation.
    /// - Returns: An array containing the bytes.
    public var bytesArray: [UInt8] {
        Array(self)
    }
}

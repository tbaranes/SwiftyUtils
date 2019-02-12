//
//  SystemUtility.swift
//  SwiftyUtils
//
//  Created by Michael Redig on 2/11/19.
//  Copyright © 2019 Tom Baranes. All rights reserved.
//

import Foundation


public struct SystemUtility {
    public static func shell(_ args: [String]) -> (returnCode: Int32, stdOut: String, stdError: String) {
        let task = Process()
        task.launchPath = "/usr/bin/env"
        task.arguments = args

        let pipeOut = Pipe()
        let pipeError = Pipe()
        task.standardOutput = pipeOut
        task.standardError = pipeError
        task.launch()
        task.waitUntilExit()

        let dataOut = pipeOut.fileHandleForReading.readDataToEndOfFile()
        let stdOut = String(data: dataOut, encoding: .utf8) ?? ""
        let dataError = pipeError.fileHandleForReading.readDataToEndOfFile()
        let stdError = String(data: dataError, encoding: .utf8) ?? ""

        let rCode = task.terminationStatus

        return (rCode, stdOut, stdError)
    }
    
    public static func shellArrayOut(_ args: [String]) -> (returnCode: Int32, stdOut: [String], stdError: [String]) {
        let (rCode, stdOut, stdErr) = shell(args)
        let output = stdOut.split(separator: "\n").map{String($0)}
        let error = stdErr.split(separator: "\n").map{String($0)}
        return (rCode, output, error)
    }
}

//
//  SystemUtility.swift
//  SwiftyUtils
//
//  Created by Michael Redig on 2/11/19.
//  Copyright © 2019 Tom Baranes. All rights reserved.
//

import Foundation

#if os(macOS)

public typealias ShellOutput = (returnCode: Int32, stdOut: String, stdError: String)
public typealias ShellArrayOutput = (returnCode: Int32, stdOut: [String], stdError: [String])

public enum SystemUtility {
    /**
     Runs a command on a system shell and provides the return code for success, STDOUT, and STDERR.
     
     - Parameter args: an array starting with the command and any following arguments as separate Strings in the array.
     - Parameter launchPath: path the base executable (defaults to "/usr/bin/env" and can be ignored in most cases)
     
     - Returns: tuple with the following structure: (returnCode: Int32, stdOut: String, stdError: String)
     
     
         let (rCode, stdOut, stdErr) = SystemUtility.shell(["ls", "-l", "/"])
         // rCode = 0 (which is "true" in shell)
         // stdOut = "total 13\ndrwxrwxr-x+ 91 root  admin  2912 Feb 11 01:24 Applications" ... etc
         // stdErr = ""

    */
	public static func shell(_ args: [String], _ launchPath: String = "/usr/bin/env") -> ShellOutput {
        let task = Process()
        task.launchPath = launchPath
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

    /**
     Runs a command on a system shell and provides the return code for success, STDOUT, and STDERR.
     The returned information is separated into an array of Strings separated by newlines.
     
     - Parameter args: an array starting with the command and any following arguments as separate Strings in the array.
     - Parameter launchPath: path the base executable (defaults to "/usr/bin/env" and can be ignored in most cases)
     
     - Returns: tuple with the following structure: (returnCode: Int32, stdOut: [String], stdError: [String])
     
     
         let (rCode, stdOut, stdErr) = SystemUtility.shellArrayOut(["ls", "-l", "/"])
         // rCode = 0 (which is "true" in shell)
         // stdOut = ["total 13", "drwxrwxr-x+ 91 root  admin  2912 Feb 11 01:24 Applications" ...  etc]
         // stdErr = [""]
     
     */
    public static func shellArrayOut(_ args: [String], _ launchPath: String = "/usr/bin/env") -> ShellArrayOutput {
        let (rCode, stdOut, stdErr) = shell(args, launchPath)
        let output = stdOut.split(separator: "\n").map { String($0) }
        let error = stdErr.split(separator: "\n").map { String($0) }
        return (rCode, output, error)
    }
}
#endif

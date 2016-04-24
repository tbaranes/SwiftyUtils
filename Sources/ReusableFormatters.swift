// NSDateFormatterExtension.swift
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

public struct DateFormatter {
    
    public static let sharedInstance = NSDateFormatter()
    private init() {}
    
}

public struct NumberFormatter {
    
    public static let sharedInstance = NSNumberFormatter()
    private init() {}
    
}

public struct ByteCountFormatter {

    public static let sharedInstance = NSByteCountFormatter()
    private init() {}
    
}

public struct DateComponentsFormatter {
    
    public static let sharedInstance = NSDateComponentsFormatter()
    private init() {}
    
}

public struct DateIntervalFormatter {
    
    public static let sharedInstance = NSDateIntervalFormatter()
    private init() {}
    
}

public struct EnergyFormatter {
    
    public static let sharedInstance = NSEnergyFormatter()
    private init() {}
    
}

public struct MassFormatter {
    
    public static let sharedInstance = NSMassFormatter()
    private init() {}
    
}

public struct LengthFormatter {
    
    public static let sharedInstance = NSLengthFormatter()
    private init() {}
    
}

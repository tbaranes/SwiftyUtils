// DoubleExtension.swift
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

public extension Double {
    public var millisecond: NSTimeInterval { return self / 1000 }
    public var milliseconds: NSTimeInterval { return self / 1000 }
    public var ms: NSTimeInterval { return self / 1000 }
    
    public var second: NSTimeInterval { return self }
    public var seconds: NSTimeInterval { return self }
    
    public var minute: NSTimeInterval { return self * 60 }
    public var minutes: NSTimeInterval { return self * 60 }
    
    public var hour: NSTimeInterval { return self * 3600 }
    public var hours: NSTimeInterval { return self * 3600 }
    
    public var day: NSTimeInterval { return self * 3600 * 24 }
    public var days: NSTimeInterval { return self * 3600 * 24 }
}
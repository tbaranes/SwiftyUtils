// NotificationObserver.swift
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

public class BlockNotification {
    
    public let name: String
    private var object: AnyObject?
    private let closure: ((NSNotification) -> Void)
    
    // MARK - Initializers
    
    public init(name: String, closure: (NSNotification) -> ()) {
        self.name = name
        self.closure = closure
        self.start();
    }
    
    public convenience init(name: String, object: AnyObject, closure: (NSNotification) -> ()) {
        self.init(name: name, closure: closure)
        self.object = object;
    }
    
    deinit {
        stop()
    }
    
    // MARK - 
    
    public  func start() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(handleNotification(_:)), name: name, object: object)
    }
    
    public  func stop() {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    // MARK - Action
    
    dynamic func handleNotification(notification: NSNotification) {
        closure(notification)
    }
    
}
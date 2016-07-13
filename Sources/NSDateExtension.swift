//
//  Created by Tom Baranes on 24/04/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import Foundation

// MARK: - Format

public extension NSDate {

    public convenience init?(fromString string: String, format: String) {
        let formatter = SUDateFormatter.sharedInstance
        formatter.dateFormat = format
        guard let date = formatter.date(from: string) else {
            return nil
        }
        self.init(timeInterval: 0, since: date)
    }

    public func toString(dateStyle: DateFormatter.Style = .medium, timeStyle: DateFormatter.Style = .medium) -> String {
        let formatter = SUDateFormatter.sharedInstance
        formatter.dateStyle = dateStyle
        formatter.timeStyle = timeStyle
        return formatter.string(from: self as Date)
    }

    public func toString(format: String) -> String {
        let formatter = SUDateFormatter.sharedInstance
        formatter.dateFormat = format
        return formatter.string(from: self as Date)
    }

}

// MARK: - InBetweenDate

public extension NSDate {

    public func daysInBetweenDate(_ date: NSDate) -> Double {
        var diff = self.timeIntervalSinceNow - date.timeIntervalSinceNow
        diff = fabs(diff / 86400)
        return diff
    }

    public func hoursInBetweenDate(_ date: NSDate) -> Double {
        var diff = self.timeIntervalSinceNow - date.timeIntervalSinceNow
        diff = fabs(diff / 3600)
        return diff
    }

    public func minutesInBetweenDate(_ date: NSDate) -> Double {
        var diff = self.timeIntervalSinceNow - date.timeIntervalSinceNow
        diff = fabs(diff / 60)
        return diff
    }

    public func secondsInBetweenDate(_ date: NSDate) -> Double {
        var diff = self.timeIntervalSinceNow - date.timeIntervalSinceNow
        diff = fabs(diff)
        return diff
    }

}

public func == (lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs.isEqual(to: rhs as Date as Date)
}

public func < (lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs.compare(rhs as Date) == .orderedAscending
}

public func > (lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs.compare(rhs as Date) == .orderedDescending
}

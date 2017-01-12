//
//  Created by Tom Baranes on 24/04/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import Foundation

// MARK: - Format

public extension Date {

    public init?(fromString string: String, format: String) {
        let formatter = SUDateFormatter.shared
        formatter.dateFormat = format
        guard let date = formatter.date(from: string) else {
            return nil
        }
        self.init(timeInterval: 0, since: date)
    }

    public func toString(dateStyle: DateFormatter.Style = .medium, timeStyle: DateFormatter.Style = .medium) -> String {
        let formatter = SUDateFormatter.shared
        formatter.dateStyle = dateStyle
        formatter.timeStyle = timeStyle
        return formatter.string(from: self as Date)
    }

    public func toString(format: String) -> String {
        let formatter = SUDateFormatter.shared
        formatter.dateFormat = format
        return formatter.string(from: self as Date)
    }

}

// MARK: - InBetweenDate

public extension Date {

    public func days(inBetween date: Date) -> Double {
        var diff = self.timeIntervalSinceNow - date.timeIntervalSinceNow
        diff = fabs(diff / 86_400)
        return diff
    }

    public func hours(inBetween date: Date) -> Double {
        var diff = self.timeIntervalSinceNow - date.timeIntervalSinceNow
        diff = fabs(diff / 3600)
        return diff
    }

    public func minutes(inBetween date: Date) -> Double {
        var diff = self.timeIntervalSinceNow - date.timeIntervalSinceNow
        diff = fabs(diff / 60)
        return diff
    }

    public func seconds(inBetween date: Date) -> Double {
        var diff = self.timeIntervalSinceNow - date.timeIntervalSinceNow
        diff = fabs(diff)
        return diff
    }

}

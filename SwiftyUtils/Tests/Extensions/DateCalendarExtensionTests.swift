//
//  Created by Tom Baranes on 23/04/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import XCTest
@testable import SwiftyUtils

final class DateCalendarExtensionTests: XCTestCase {

    let birthdate: Date = {
        var components = DateComponents()
        components.year = 1995
        components.month = 1
        components.day = 14
        components.hour = 13
        components.minute = 7
        components.second = 24
        components.nanosecond = 920110 * 1_000
        return NSCalendar.current.date(from: components)!
    }()


    // MARK:

    func testInitWithDatetime() {
        let date = Date(year: 1995, month: 1, day: 14, hours: 13, minutes: 7, seconds: 24.920110)
        XCTAssertEqual(date, self.birthdate)
    }

    func testInitWithDate() {
        let date = Date(year: 1995, month: 1, day: 14)
        XCTAssertEqual(date, self.birthdate.date)
    }

    func testInitWithTime() {
        let date = Date(hours: 7, minutes: 8, seconds: 9) // it doesn't take care of year, month and day
        XCTAssertEqual(date.hours, 7)
        XCTAssertEqual(date.minutes, 8)
        XCTAssertEqual(date.seconds, 9)
    }


    // MARK:

    func testYear() {
        XCTAssertEqual(self.birthdate.year, 1995)
    }

    func testMonth() {
        XCTAssertEqual(self.birthdate.month, 1)
    }

    func testDay() {
        XCTAssertEqual(self.birthdate.day, 14)
    }

    func testHour() {
        XCTAssertEqual(self.birthdate.hours, 13)
    }

    func testMinute() {
        XCTAssertEqual(self.birthdate.minutes, 7)
    }

    func testSecond() {
        XCTAssertEqual(Float(self.birthdate.seconds), 24.920110)
    }

    func testDateWithYear() {
        XCTAssertEqual(self.birthdate.with(year: 2013).year, 2013)
    }

    func testDateWithMonth() {
        XCTAssertEqual(self.birthdate.with(month: 7).month, 7)
    }

    func testDateWithDay() {
        XCTAssertEqual(self.birthdate.with(day: 24).day, 24)
    }

    func testDateWithHour() {
        XCTAssertEqual(self.birthdate.with(hours: 12).hours, 12)
    }

    func testDateWithMinute() {
        XCTAssertEqual(self.birthdate.with(minutes: 34).minutes, 34)
    }

    func testDateWithSecond() {
        XCTAssertEqual(self.birthdate.with(seconds: 56).seconds, 56)
    }

    func test_withWeekday() {
        XCTAssertEqual(Date.date(2015, 09, 16).with(weekday: 1), Date.date(2015, 9, 13))
        XCTAssertEqual(Date.date(2015, 09, 16).with(weekday: 2), Date.date(2015, 9, 14))
        XCTAssertEqual(Date.date(2015, 09, 16).with(weekday: 5), Date.date(2015, 9, 17))
    }


    // MARK:

    func testDate() {
        XCTAssertEqual(self.birthdate.date.year, 1995)
        XCTAssertEqual(self.birthdate.date.month, 1)
        XCTAssertEqual(self.birthdate.date.day, 14)
        XCTAssertEqual(self.birthdate.date.hours, 0)
        XCTAssertEqual(self.birthdate.date.minutes, 0)
        XCTAssertEqual(self.birthdate.date.seconds, 0)
    }

    func testToday() {
        XCTAssertEqual(Date.today, Date().date)
    }

    // MARK:

    func testAfterYears() {
        XCTAssertEqual(3.years.after(self.birthdate), self.birthdate.with(year: self.birthdate.year + 3))
    }

    func testAfterMonths() {
        XCTAssertEqual(2.months.after(self.birthdate), self.birthdate.with(month: self.birthdate.month + 2))
    }

    func testAfterDays() {
        XCTAssertEqual(1.day.after(self.birthdate), self.birthdate.with(day: self.birthdate.day + 1))
    }

    func testAfterHours() {
        XCTAssertEqual(10.hours.after(self.birthdate), self.birthdate.with(hours: self.birthdate.hours + 10))
    }

    func testAfterMinutes() {
        XCTAssertEqual(11.minutes.after(self.birthdate), self.birthdate.with(minutes: self.birthdate.minutes + 11))
    }

    func testAfterSeconds() {
        XCTAssertEqual(12.seconds.after(self.birthdate), self.birthdate.with(seconds: self.birthdate.seconds + 12))
    }

    func testAfterSeconds_float() {
        XCTAssertEqual(13.seconds.after(self.birthdate), self.birthdate.with(seconds: self.birthdate.seconds + 13))
    }


    // MARK:

    func testBeforeYears() {
        XCTAssertEqual(3.years.before(self.birthdate), self.birthdate.with(year: self.birthdate.year - 3))
    }

    func testBeforeMonths() {
        XCTAssertEqual(2.months.before(self.birthdate), self.birthdate.with(month: self.birthdate.month - 2))
    }

    func testBeforeDays() {
        XCTAssertEqual(1.day.before(self.birthdate), self.birthdate.with(day: self.birthdate.day - 1))
    }

    func testBeforeHours() {
        XCTAssertEqual(10.hours.before(self.birthdate), self.birthdate.with(hours: self.birthdate.hours - 10))
    }

    func testBeforeMinutes() {
        XCTAssertEqual(11.minutes.before(self.birthdate), self.birthdate.with(minutes: self.birthdate.minutes - 11))
    }

    func testBeforeSeconds() {
        XCTAssertEqual(12.seconds.before(self.birthdate), self.birthdate.with(seconds: self.birthdate.seconds - 12))
    }

    func testBeforeSeconds_float() {
        XCTAssertEqual(13.seconds.before(self.birthdate), self.birthdate.with(seconds: self.birthdate.seconds - 13))
    }


    // MARK:

    func testMonthAndWeekday() {
        XCTAssertEqual(Date.november.with(year: 1968).first.saturday, Date.date(1968, 11, 2))
        XCTAssertEqual(Date.january.with(year: 1995).second.saturday, Date.date(1995, 1, 14))
        XCTAssertEqual(Date.january.with(year: 1992).second.friday, Date.date(1992, 1, 10))
        XCTAssertEqual(Date.july.with(year: 2013).fourth.wednesday, Date.date(2013, 7, 24))
        XCTAssertEqual(Date.december.with(year: 2014).fourth.thursday, Date.date(2014, 12, 25))
        XCTAssertEqual(Date.may.with(year: 2016).fifth.monday, Date.date(2016, 5, 30))
        XCTAssertEqual(Date.march.with(year: 2015).last.tuesday, Date.date(2015, 3, 31))
        XCTAssertEqual(Date.december.with(year: 1995).fifth.saturday, Date.date(1995, 12, 30))
        XCTAssertEqual(Date.december.with(year: 1995).fifth.sunday, Date.date(1995, 12, 31))
    }
    
}

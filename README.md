# SwiftyUtils

[![CI Status](https://travis-ci.org/tbaranes/SwiftyUtils.svg)](https://travis-ci.org/tbaranes/SwiftyUtils)
![Language](https://img.shields.io/badge/language-Swift%204.0-orange.svg)
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/SwiftyUtils.svg)](https://img.shields.io/cocoapods/v/SwiftyUtils.svg)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Platform](https://img.shields.io/cocoapods/p/SwiftyUtils.svg?style=flat)](http://cocoadocs.org/docsets/SwiftyUtils)

SwiftyUtils groups all the reusable code that we need to ship in each project. This framework contains:
- extension
- Protocols
- Structs
- Subclasses

Working on iOS, macOS, tvOS, and watchOS, everything has been made to be easy to use! :tada:

## Contents

Check out the repository to find examples / tests for each feature.

**Available for iOS, macOS, tvOS and watchOS:**

- [Array](#array-extension)
- [Bundle](#bundle-extension)
- [CGFloat](#cgfloat-extension)
- [CGPoint](#cgpoint-extension)
- [CGRect](#cgrect-extension)
- [CGSize](#cgsize-extension)
- [Color](#color-extension)
- [Date](#date-extension)
- [Dictionary](#dictionary-extension)
- [Double](#double-extension)
- [FileManager](#filemanager-extension)
- [Int](#int-extension)
- [NotificationCenter](#notificationcenter-extension)
- [NSLayoutConstraint](#nslayoutconstraint-extension)
- [NSMutableAttributedString](#nsmutableattributedstring-extension)
- [NSObject](#nsobject-extension)
- [NSRange](#nsrange-extension)
- [ReusableFormatters](#reusableformatters)
- [String](#string-extension)
- [Timer](#timer-extension)
- [URL](#url-extension)
- [UnitTesting](#unittesting)
- [UITesting](#uitesting)
- [UserDefaults](#userdefaults-extension)
- **Protocols:**
 - [Injectable](#injectable)
 - [Iteratable](#iteratable)
 - [Occupiable](#occupiable)
 - [Then](#then)

**Available for iOS, tvOS, and watchOS (a few):**

- [UIAlertController](#uialertcontroller-extension)
- [UIApplication](#uiapplication-extension)
- [UIDevice](#uidevice-extension)
- [UIImage](#uiimage-extension)
- [UILabel](#uilabel-extension)
- [UIScreen](#uiscreen-extension)
- [UIStoryboard](#uistoryboard-extension)
- [UISwitch](#uiswitch-extension)
- [UITextFied](#uitextfield-extension)
- [UIView](#uiview-extension)
- [UIViewController](#uiviewcontroller-extension)
- [Simulator](#simulator)

**Available for macOS:**

- [NSView](#nsview-extension)

## Available for iOS, macOS, tvOS and watchOS

### Array extension

Safely access to an element:

```swift
var array = [1, 2, 3]
print(array[safe: 0]) // Optional(1)
print(array[safe: 10]) // nil
```

Access to a random element:

``` swift
var array = [1, 2, 3]
print(array.random()) // 1, 2 or 3
```

Find all the index of an object:

``` swift
var array = [1, 2, 3, 1]
print(array.indexes(of: 1)) // [0,3]
```

Get index of first / last occurrence of an object:

``` swift
var array = [1, 2, 3, 1]
print(array.firstIndex(of: 1)) // Optional(0)
print(array.lastIndex(of: 1)) // Optional(3)
```

Remove an object:

``` swift
var array = [1, 2, 3]
myArray.remove(object: 2)
print(myArray) // [1, 3]
myArray.remove(objects: [1, 3])
print(myArray) // []
```

Remove all the duplicates:

```swift
var array = [0, 0, 1, 1, 2]
array.removeDuplicates()
print(array) // [0,1,2]

let array = [0, 0, 1, 1, 2]
let newArray.removedDuplicates()
print(newArray) // [0,1,2]
```

Remove all instances of an item:

``` swift
var array = [0, 0, 1, 1, 2]
array.removeAll(0)
print(array) // [1,1,2]

let array = [0, 0, 1, 1, 2]
let newArray = array.removedAll(0)
print(newArray) // [1,1,2]
```

Check if an array is a subset of another array:

``` swift
var array = [1, 2, 3]
print(array.contains([1, 2])) // true
print(array.contains([5])) // false
```

Determine if an array contains an object:

``` swift
var array = [1, 2, 3]
print(array.contains(1)) // true
print(array.contains(11)) // false
```

Get intersection and union of two arrays:

``` swift
var myArray = [1, 2, 3]
print(array.intersection(for: [1, 5, 3])) // [1, 3]
print(array.union(values: [5, 6])) // [1, 2, 3, 5, 6]
```

Get difference between two arrays:

``` swift
var array = [1, 2, 3]
print(array.difference(with: [1])) // [2, 3]
```

Split into chunk of a specific size:

``` swift
var array = [1, 2, 3, 4]
print(array.split(intoChunksOf: 2)) // [[1, 2], [3, 4]]
```

Shuffle array's elements:

``` swift
var array = [1, 2, 3, 5, 6]
array.shuffle()
print(array) // [3, 6, 1, 2, 5]

let arrayShuffled = array.shuffled()
print(arrayShuffled) // [2, 1, 6, 3, 5]
```

Test all elements of an array against a closure:

``` swift
var array = [1, 2, 3]
let result = array.testAll {
	$0 == 1
}
print(result) // false
```

### Bundle extension

Get bundle information:

```swift
Bundle.main.appName
Bundle(url: url)?.appName

Bundle.main.appVersion
Bundle(url: url)?.appVersion

Bundle.main.appBuild
Bundle(url: url)?.appBuild

Bundle.main.bundleId
Bundle(url: url)?.bundleId

Bundle.main.schemes
Bundle(url: url)?.schemes

Bundle.main.mainScheme
Bundle(url: url)?.mainScheme

Bundle.main.isInTestFlight
Bundle(url: url)?.isInTestFlight
```

### CGFloat extension

Create a CGFloat from a Float or an Integer:

```swift
let imageViewTop = 15.f
```

### CGPoint extension

Add two `CGPoint`:

```swift
var point1 = CGPoint(x: 10, y: 10)
let point2 = CGPoint(x: 10, y: 10)
print(point1 + point2) // CGPoint(x: 20, y: 20)

point1 += point2
print(point1) // CGPoint(x: 20, y: 20)
```

Substract two `CGPoint`:

```swift
var point1 = CGPoint(x: 10, y: 10)
let point2 = CGPoint(x: 10, y: 10)
print(point1 - point2) // CGPoint(x: 0, y: 0)

point1 -= point2
print(point1) // CGPoint(x: 0, y: 0)
```

Multiply a `CGPoint` with a scalar:

```swift
var point1 = CGPoint(x: 10, y: 10)
print(point1 * 2) // CGPoint(x: 20, y: 20)

point1 *= 2
print(point1) // CGPoint(x: 20, y: 20)
```

### CGRect extension

Get the origin's x and y coordinates:

```swift
aRect.x // instead of aRect.origin.x
aRect.y // instead of aRect.origin.y
```

Change one property of a `CGRect`:

```swift
let rect = CGRect(x: 10, y: 20, width: 30, height: 40) 
let widerRect = rect.with(width: 100) // x: 10, y: 20, width: 100, height: 40
let tallerRect = rect.with(height: 100) // x: 10, y: 20, width: 30, height: 100
let rectAtAnotherPosition = rect.with(x: 100).with(y: 200) // x: 100, y: 200, width: 30, height: 40
let rectWithAnotherSize = rect.with(size: CGSize(width: 200, height: 200)) // x: 10, y: 20, width: 200, height: 200
let rectAtYetAnotherPosition = rect.with(origin: CGPoint(x: 100, y: 100)) // x: 100, y: 100, width: 30, height: 40
```

### CGSize extension

Add two `CGSize`:

```swift
var size1 = CGSize(width: 10, height: 10)
let size2 = CGSize(width: 10, height: 10)
print(size1 + size2) // CGSize(width: 20, height: 20)

size1 += size2
print(size1) // CGSize(width: 20, height: 20)
```

Substract two `CGSize`:

```swift
var size1 = CGSize(width: 10, height: 10)
let size2 = CGSize(width: 10, height: 10)
print(size1 - size2) // CGSize(width: 0, height: 0)

size1 -= size2
print(size1) // CGSize(width: 0, height: 0)
```

Multiply a `CGSize` with a scalar:

```swift
var size1 = CGSize(x: 10, y: 10)
print(size1 * 2) // CGSize(width: 20, height: 20)

size1 *= 2
print(size1) // CGSize(width: 20, height: 20)
```

### Color extension

Create colors with HEX values:

``` swift
let myUIColor = UIColor(hex: "233C64") // Equals 35,60,100,1
let myNSColor = NSColor(hex: "233C64") // Equals 35,60,100,1
```

Access to individual color value:

```swift
let myColor = UIColor(red: 120, green: 205, blue: 44, alpha: 0.3)
print(myColor.redComponent) // 120
print(myColor.greenComponent) // 205
print(myColor.blueComponent) // 44
print(myColor.alpha) // 0.3
```

Get lighter or darker variants of colors instances:

```swift
let color = UIColor(red: 0.5, green: 0.5, blue: 1.0, alpha: 1.0)
let lighter = color.lighter(amount: 0.5)
let darker = color.darker(amount: 0.5)
// OR
let lighter = color.lighter()
let darker = color.darker()

let color = NSColor(red: 0.5, green: 0.5, blue: 1.0, alpha: 1.0)
let lighter = color.lighter(amount: 0.5)
let lighter = color.lighter()
// OR
let darker = color.darker(amount: 0.5)
let darker = color.darker()
```

## Date extension

Initialize from string:

``` swift
let format = "yyyy/MM/dd"
let string = "2015/03/11"
print(Date(fromString: string, format: format)) // Optional("2015/03/11 00:00:00 +0000")
```

Convert date to string:

``` swift
let now = Date()
print(now.string())
print(now.string(dateStyle: .medium, timeStyle: .medium))
print(now.string(format: "yyyy/MM/dd HH:mm:ss"))
```

See how much time passed:

``` swift
let now = Date()
let later = Date(timeIntervalSinceNow: -100000)
print(later.days(since: now)) // 1.15740740782409
print(later.hours(since: now)) // 27.7777777733571
print(later.minutes(since: now)) // 1666.66666641732
print(later.seconds(since: now)) // 99999.999984026
```

Check if a date is in future or past:

```swift
let later = Date(timeIntervalSinceNow: -100000)
print(now.isInFuture) // true
print(now.isInPast) // false
```

### Dictionary extension

Check if a key exists in the dictionary:

``` swift
let dic = ["one": 1, "two": 2]
print(dic.has(key: "one")) // True
print(dic.has(key: "1")) // False
```

Access a random element:

``` swift
let dic= ["one": 1, "two": 2]
print(dic.random()) // 1 or something else
```

Easily get union of two dictionaries:

``` swift
let dic1 = ["one": 1, "two": 2]
let dic2 = ["one": 1, "four": 4]

let dic3 = dic1.union(values: dic2)
print(dic3) // ["one": 1, "two": 2, "four": 4]
```

`map` a dictionary:

```swift
let dic = ["a": 1, "b": 2, "c": 3]
let result = dic.map { key, value in
	return (key.uppercased(), "\(value * 2)")
}
print(dic) // ["A": "2, "B": "4", "C": "6"]
```

`flatMap` a dictionary:

```swift
let dic = ["a": 1, "b": 2, "c": 3]
let result = dic.flatMap { key, value -> (String, String)? in
	if value % 2 == 0 {
	 	return nil
	}
	return (key.uppercased(), "\(value * 2)")
}
print(dic) // ["A": "2, "C": "6"]
```

Get difference of two dictionaries:

``` swift
let dic1 = ["one": 1, "two": 2]
let dic2 = ["one": 1, "four": 4]
difference(with: dic1, dic2) // ["two": 2, "four": 4]
```

Merge several dictionaries:

```swift
let dic1 = ["one": 1, "two": 2]
let dic2 = ["three": 3, "four": 4]
var finalDic = [String: Int]()
finalDic.merge(with: dic1, dic2)
print(finalDic) // ["one": 1, "two": 2, "three": 3, "four": 4]
```

Test each element against a closure:

``` swift
var dic = ["abc": "abc, "ab": "a", "b": "b"]
let result = dic.testAll { key, _ in 
    key.length < 3 
}
print(result) // false
```

### Double extension

Get the time interval for a number of milliseconds, seconds, hour, or days:

```swift
print(1.second) // 1
print(1.minute) // 60
print(1.hour) // 3600
print(1.2.seconds) // 1.2
print(1.5.minutes) // 90.0
print(1.5.hours) // 5400.0
print(1.3.milliseconds) // 0.0013
print(0.5.day) // 43200
print(1.day) // 86400
print(2.day) // 172800
```

Formatted value with the locale currency:

```
print(Double(3.24).formattedPrice) // "$3.24"
print(Double(10).formattedPrice) // "$10.00"
```


### FileManager extension

Get documents directory url following the os:

```
FileManager.document
// OR
FileManager.default.document
```

Create a new directory:

```
FileManager.createDirectory(at: directoryUrl)
// OR
FileManager.default.createDirectory(at: directoryUrl)
```

Delete contents of temporary directory

```
FileManager.removeTemporaryFiles()
// OR
FileManager.default.removeTemporaryFiles()
```

Delete contents of documents directory

```
FileManager.removeDocumentFiles()
// OR
FileManager.default.removeDocumentFiles()
```

### Int extension

```swift
var myNumber = -33
print(myNumber.isEven) // false
print(myNumber.isOdd) // true
print(myNumber.isPositive) // false
print(myNumber.isNegative) // true
print(myNumber.digits) // 2
```

Round to the nearest / nearest down / nearest up:

```swift
var value = 17572
print(value.nearestDozens) // 17570
print(value.nearestHundreds) // 17600
print(value.nearestThousands) // 18000
print(value.nearest(to: 1000) // 18000

value = 17578
print(value.nearestBelowDozens) // 17570
print(value.nearestBelowHundreds) // 17500
print(value.nearestBelowThousands) // 17000
print(value.nearestBelow(to: 1000) // 17000

value = 17442
print(value.nearestUpDozens) // 17450
print(value.nearestUpHundreds) // 17500)
print(value.nearestUpThousands) // 18000
print(value.nearestUp(to: 1000) // 18000
```

Formatted value with the locale currency:

```
print(10.formattedPrice) // "$10.00"
```

### NotificationCenter extension

Post a notification from a specific queue:

```
NotificationCenter.default.postNotification("aNotification", queue: DispatchQueue.main) 
NotificationCenter.default.postNotification("aNotification", object: aObject queue: DispatchQueue.main)
NotificationCenter.default.postNotification("aNotification", object: aObject userInfo: userInfo queue: DispatchQueue.main)
```

### NSLayoutConstraint extension

*No available for watchOS*

Apply a multiplier to a constraint (currently working only for width and height):

```swift
let view = UIView(CGRect(x: 0, y: 0, width: 100, height: 200))
let constraint = NSLayoutConstraint(item: view, attribute: .width, ...)
constraint.apply(multiplier: 0.5, toView: superview)
print(constraint.constants) // 50

let constraint = NSLayoutConstraint(item: view, attribute: .height, ...)
constraint.apply(multiplier0.5, toView: superview)
print(constraint.constants) // 100
```


### NSMutableAttributedString extension

Colorize each occurence:

```swift
let attrStr: NSMutableAttributedString = NSMutableAttributedString.colored(inText: "hello world", color: .yellow, occurences: "llo")

// OR

let attrStr: NSMutableAttributedString = NSMutableAttributedString(string: "Hello world")
attrStr.color(.yellow, occurences: "llo")
```

Colorize everything after an occurence:

```swift
let attrStr = NSMutableAttributedString.colored(inText: "Hello world", color: .yellow, afterOcurrence: "llo")

// OR

let attrStr = NSMutableAttributedString(string: "Hello world")
attrStr.color(.yellow, afterOcurrence: "llo")
```

Strike each occurence:

```swift
let attrStr: NSMutableAttributedString = NSMutableAttributedString.struck(inText: "Hello world", occurences: "llo")

// OR

let attrStr = NSMutableAttributedString(string: "Hello world")
attrStr.strike(occurences: "llo")
```

Strike everything after an occurence:

```swift
let attrStr: NSMutableAttributedString = NSMutableAttributedString.struck(inText: "Hello world", afterOcurrence: "llo")

// OR

let attrStr = NSMutableAttributedString(string: "Hello world")
attrStr.strike(ocurrences: "llo")
```

Underline each occurence:

```swift
let attrStr: NSMutableAttributedString = NSMutableAttributedString.underlined(inText: "Hello world", occurences: "llo")

// OR

let attrStr = NSMutableAttributedString(string: "Hello world")
attrStr.underline(occurences: "llo")
```

Underline everything after an occurence:

```swift
let attrStr: NSMutableAttributedString = NSMutableAttributedString.underlined(inText: "Hello world", afterOcurrence: "llo")

// OR

let attrStr = NSMutableAttributedString(string: "Hello world")
attrStr.underline(afterOcurrence: "llo")
```

Use custom font for each occurence:

```swift
let font = UIFont.boldSystemFont(ofSize: 15)
let attrStr: NSMutableAttributedString = NSMutableAttributedString.font(inText: "hello world", font: font, occurences: "llo")

// OR

let attrStr: NSMutableAttributedString = NSMutableAttributedString(string: "Hello world")
attrStr.font(font, occurences: "llo")
```

Custom font for everything after an occurence:

```swift
let font = UIFont.boldSystemFont(ofSize: 15)
let attrStr = NSMutableAttributedString.colored(inText: "Hello world", font: font, afterOcurrence: "llo")

// OR

let attrStr = NSMutableAttributedString(string: "Hello world")
attrStr.font(font, afterOcurrence: "llo")
```

### NSObject extension

Get the class name of a `NSObject`:

```swift
#if !os(macOS)
	let vc = NSViewController()
	print(vc.className) // NSViewController
#else
	let vc = UIViewController()
	print(vc.className) // UIViewController
	print(UIViewController.className) // UIViewController
#endif
```

### NSRange extension

Range after an occurence:

```swift
let string = "Hello world"
let range = NSRange(text: string, afterOccurence: "llo")
print(range) // location: 3, length: 8
```

Range of string:

```swift
let string = "Hello world"
let stringToFind = "ello wo"
let range = NSRange(textToFind: stringToFind, in: string)
print(range) // location: 1, length: 7
```

### ReusableFormatters

Reuse your formatter to avoid heavy allocation:

```swift
SUDateFormatter.shared
SUNumberFormatter.shared
SUByteCountFormatter.shared
SUDateComponentsFormatter.shared
SUDateIntervalFormatter.shared
SUEnergyFormatter.shared
SUMassFormatter.shared
```

### String extension

Access with subscript:

```swift
var string = "hello world"
print(string[0]) // h
print(string[2]) // l
print(string[1...3]) // ell
```

Check if it contains a string:

```swift
let string = "Hello world"
print (string.contains(text: "hello")) // true
print (string.contains(text: "hellooooo")) // false
```

Check if it's a number:

```swift
var string = "4242"
print(string.isNumber) // true

var string = "test"
print(string.isNumber) // false
```

Check if it's a valid email:

```swift
var string = "test@gmail.com"
print(string.isEmail) // true
var string = "test@"
print(string.isEmail) // false
```

Uncamelize a string:

```swift
var camelString = "isCamelled"
print(camelString.uncamelize) // is_camelled
```

Capitalize the first letter:

```swift
var string = "hello world"
string = string.capitalizedFirst
print(string)// Hello world
```

Trimmed spaces and new lines:

```swift
var string = " I'  am a    test  \n  "
print(string.trimmed()) // I'am a test
```

Truncated to have a limit of characters:

```swift
var string = "0123456789aaaa"
print(string.truncate(limit: 10)) // 0123456789...
```

Split string in chunks of n elements:

```swift
let string = "abcd"
print(string.split(intoChunksOf: 2)) // ["ab", "cd"]
```

## Timer extension

Schedule timer every seconds:

``` swift
var count = 0
Timer.every(1.second, fireImmediately: true) { timer in // fireImmediately is an optional parameter, defaults to false
    print("Will print every second")
    if count == 3 {
        timer.invalidate()
    }
    count++
}
```

Schedule timer after a certain delay:

``` swift
Timer.after(2.seconds) { _ in
    print("Prints this 2 seconds later in main queue")
}
```

Manual scheduling a timer:

``` swift
let timer = Timer.new(every: 2.seconds) { _ in
    print("Prints this 2 seconds later in main queue")
}
timer.start(onRunLoop: RunLoop.current, modes: RunLoopMode.defaultRunLoopMode)
```

Manual scheduling a timer with a delay:

``` swift
let timer = Timer.new(after: 2.seconds) { _ in
    print("Prints this 2 seconds later in main queue")
}
timer.start(onRunLoop: RunLoop.current, modes: RunLoopMode.defaultRunLoopMode)
```

### URL extension

Get query parameters from URL:

``` swift
let url = URL(string: "http://example.com/api?v=1.1&q=google")
let queryParameters = url?.queryParameters
print(queryParameters?["v"]) // 1.1
print(queryParameters?["q"]) // google
print(queryParameters?["other"]) // nil
```

Add skip backup attributes to you URL:

``` swift
let url = URL(string: "/path/to/your/file")        
url?.addSkipBackupAttribute() // File at url won't be backupped!
```

### UnitTesting

Grand Central Dispatch sugar syntax:

Detect if UITests are running:

```swift
if UnitTesting.isRunning {
  // tests are running
} else {
  // everything is fine, move along
}
```

Measure tests performance:

```
func testPerformance() {
  let measurement = measure {
    // run operation
  }
}
```

### UITesting

Detect if UITests are running:

```swift
if UITesting.isRunning {
  // tests are running
} else {
  // everything is fine, move along
}
```

### UserDefaults extension

Get and set values from `UserDefaults` with subscripts:

```swift
let Defaults = UserDefaults.standard
Defaults["userName"] = "test"
print(Defaults["userName"]) // test
```

Check if the `UserDefaults` has a key:

```swift
UserDefaults.has(key: "aKey")
// OR
UserDefaults.standard.has(key: "aKey")
```

Remove all values in `UserDefaults`:

```swift
UserDefaults.standard.removeAll()
```

### Injectable

Protocol to do `ViewController` Data Injection with Storyboards and Segues in Swift. Inspired from [Nastasha's blog](https://www.natashatherobot.com/update-view-controller-data-injection-with-storyboards-and-segues-in-swift/):

```
class RedPillViewController: UIViewController, Injectable {

    @IBOutlet weak private var mainLabel: UILabel!

    // the type matches the IOU's type
    typealias T = String

    // this is my original dependency (IOU)
    // I can now make this private!
    private var mainText: String!

    override func viewDidLoad() {
        super.viewDidLoad()

        // this will crash if the IOU is not set
        assertDependencies()

        // using the IOU if needed here,
        // but using it later is fine as well
        mainLabel.text = mainText
    }

    // Injectable Implementation
    func inject(text: T) {
        mainText = text
    }

    func assertDependencies() {
        assert(mainText != nil)
    }
}

// ViewController that will inject data...
override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

    switch segueIdentifierForSegue(segue) {
    case .TheRedPillExperience
        let redPillVC = segue.destinationViewController as? RedPillViewController
        redPillVC?.inject("😈")
    case .TheBluePillExperience:
        let bluePillVC = segue.destinationViewController as? BluePillViewController
        bluePillVC?.inject("👼")
    }
}
```

### Iteratable

Make your enums iteratable:

```swift
enum Alphabet: Iteratable {
    case a, b, c, d
}

let values = iterateEnum(Alphabet.self).map { $0 }
print(values) // [Alphabet.a, Alphabet.b, Alphabet.c, Alphabet.d]
```

### Occupiable

The following use cases works for String Array, Dictionary, and Set

`isEmpty` / `isNotEmpty`

*No optional types only*

```swift
var string = "Hello world"
print(string.isNotEmpty) // true
print(string.isEmpty) // false
```

`isNilOrEmpty`

*Optional types only*

```swift
let string: String? = ""
print(string.isNilOrEmpty) // true
```

### Then

Syntactic sugar for Swift initializers:

```swift
let label = UILabel().then {
    $0.textAlignment = .Center
    $0.textColor = .blackColor()
    $0.text = "Hello, World!"
}
```

## Available on iOS, tvOS, and watchOS (a few)

### UIAlertController extension

Create a custom `UIAlertController`:

```swift
let alertController1 = UIAlertController(title: "Title",
                                        message: "Message")
                          
let alertController2 = UIAlertController(title: "Title",
                                        message: "Message",
                                        defaultActionButtonTitle: "Cancel")
                                                      
let alertController3 = UIAlertController(title: "Title",
                                        message: "Message",
                                        defaultActionButtonTitle: "Cancel",
                                        defaultActionButtonStyle: .cancel) 
                                        
let alertController1 = UIAlertController(title: "Title",
                                        message: "Message",
                                        defaultActionButtonTitle: "Cancel",
                                        defaultActionButtonStyle: .cancel,
                                        tintColor: .blue)
```

Show an `UIAlertController`:

```swift
alertController.show()
alertController.show(animated: false)
alertController.show(animated: true, completion: {
	print("Presented")
})
```

Add an action to the `UIAlertController`:

```swift
alertController.addAction(title: "ActionTitle")

alertController.addAction(title: "ActionTitle",
                          style: .destructive)
                          
alertController.addAction(title: "ActionTitle",
                          style: .destructive,
                          isEnabled: false)
                          
alertController.addAction(title: "ActionTitle",
                          style: .destructive,
                          isEnabled: false,
                          handler: nil)
```

### UIApplication extension

Get the current view controller display:

```swift
UIApplication.shared.topViewController() // Using UIWindow's rootViewController as baseVC
UIApplication.shared.topViewController(from: baseVC) // topVC from the base view controller
```

Get the app delegate:

```swift
UIApplication.delegate(AppDelegate.self)
```

### UIDevice extension

Access to your device information:

``` swift
print(UIDevice.idForVendor) // 104C9F7F-7403-4B3E-B6A2-C222C82074FF
print(UIDevice.systemName()) // iPhone OS
print(UIDevice.systemVersion()) // 9.0
print(UIDevice.deviceName) // iPhone Simulator / iPhone 6 Wifi
print(UIDevice.deviceLanguage) // en
print(UIDevice.isPhone) // true or false
print(UIDevice.isPad) // true or false
```

Check your system version:

``` swift
print(UIDevice.isVersion(8.1)) // false
print(UIDevice.isVersionOrLater(8.1)) // true
print(UIDevice.isVersionOrEarlier(8.1)) // false
```

Force device orientation:

```swift
UIDevice.forceRotation(.portrait)
UIDevice.current.forceRotation(.portrait)
```

### UIImage extension

Create an image from a color:

```swift
let image = UIImage(color: .green)
```

Fill an image with a color:

```swift
let image = UIImage(named: "image")
let greenImage = image.filled(with: .green)
```

Combined an image with another:

```swift
let image = UIImage(named: "image")
let image2 = UIImage(named: "image2")
let combinedImage = image.combined(with: image2)
```

Change the rendering mode:

```swift
var image = UIImage(named: "image")
image = image.template // imageWithRenderingMode(.alwaysTemplate)
image = image.original // imageWithRenderingMode(.alwaysOriginal)
```

### UILabel extension

Detect if a label text is truncated:

```swift
let label = UILabel(frame: CGRect(x: 0, y: 0, width: 30, height: 40))
label.text = "I will be truncated :("
print(label.isTruncated()) // true

let label = UILabel(frame: CGRect(x: 0, y: 0, width: 30, height: 40))
label.text = ":)"
print(label.isTruncated()) // false
```

Customize label line height:

```swift
let label = UILabel(frame: CGRect(x: 0, y: 0, width: 30, height: 40))
label.setText("A long multiline text")
label.setLineHeight(0.9)
```

Customize the label truncated text (replace the default `...`):

```swift
let label = UILabel(frame: CGRect(x: 0, y: 0, width: 30, height: 40))
label.setText("I will be truncated :(", truncatedText: ".")
print(label.text) // I wi.
```

### UIScreen extension

Get the screen orientation:

```swift
if UIInterfaceOrientationIsPortrait(UIScreen.screenOrientation) {
	// Portrait
} else {
	// Landscape
}
```

Get the screen size:

```swift
print(UIScreen.size) // CGSize(375.0, 667.0) on iPhone6
print(UIScreen.width) // 375.0 on iPhone6
print(UIScreen.height) // 667.0 on iPhone6
print(UIScreen.heightWithoutStatusBar) // 647.0 on iPhone6
```

Get the status bar height:

```swift
print(UIScreen.statusBarHeight) // 20.0 on iPhone6
```

### UIStoryboard extension

Get the application's main storyboard:

```swift
let storyboard = UIStoryboard.main
```

### UISwitch extension

Toggle `UISwitch`:

```swift
let aSwitch = UISwitch(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
aSwitch.toggle()
print(aSwitch.isOn) // true

aSwitch.toggle(animated: false)
```

### UITextField extension

Modify clear button image:

```swift
let clearButtonImage = UIImage(named: "clear_button")
let textField = UITextField()
textField.setClearButton(with: clearButtonImage)
```

Modify placeholder's color:

```swift
let textField = UITextField()
// set `placeholder` or `attributedPlaceholder`
textField.setPlaceHolderTextColor(.blue)
```

### UIView extension

**Change the frame of the view easily**

```swift
let aView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
aView.x += 100 // move  to right
aView.y += 100 // move downwards
aView.width -= 10 // make the view narrower
aView.height -= 10 // make the view shorter 
```

**Automates your localizables**

```swift
aView.translateSubviews()
```

It will iterate on all the subviews of the view, and use the text / placeholder as key in `NSLocalizedString`.
By settings your localizable key in your xib / storyboard, all yours string will be automatically translated just by calling the above method.

### UIViewController extension

Reset the navigation stack by deleting previous view controllers:

```swift
let navController = UINavigationController()
navController.pushViewController(vc1, animated: true)
navController.pushViewController(vc2, animated: true)
navController.pushViewController(vc3, animated: true)
vc3.removePreviousControllers(animated: true)
print(navController.viewControllers) // [vc3]
```

Check if ViewController is onscreen and not hidden:

```swift
let viewController = UIViewController()
print(viewController.isVisible) // false
```

### Simulator

Check if you are running on a simulator:

```swift
if !Simulator.isRunning {
  // add device specific operations here
}
```

## Available on macOS

### NSView extension

**Change the frame of the view easily**
```swift
let aView = NSView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
aView.x += 100 // move  to right
aView.y += 100 // move downwards
aView.width -= 10 // make the view narrower
aView.height -= 10 // make the view shorter 
```

**Automates your localizables**

```swift
aView.convertLocalizables()
```

It will iterate on all the subviews of the view, and use the text / placeholder as key in `NSLocalizedString`.
By settings your localizable key in your xib / storyboard, all yours string will be automatically translated just by calling the above method.

## Installation

- Xcode 8 and later
- Swift 3.0
- iOS 8.0 or later
- macOS 10.10 or later
- tvOS 9.0 or later
- watchOS 2.0 or later

### Manually

Copy the SwiftyUtils folder into your Xcode project. (Make sure you add the files to your target(s))

### CocoaPods

Add `pod SwiftyUtils` to your Podfile.

### Carthage

Add `github "tbaranes/SwiftyUtils"` to your Cartfile.

### Swift Package Manager

You can use [The Swift Package Manager](https://swift.org/package-manager) to install `SwiftyUtils` by adding the proper description to your `Package.swift` file:

```
import PackageDescription

let package = Package(
    dependencies: [
        .Package(url: "https://github.com/tbaranes/SwiftyUtils.git", majorVersion: 0)
    ]
)
```

## Feedback

  * If you found a **bug**, open an **issue**
  * If you have a **feature request**, open an **issue**
  * If you want to **contribute**, submit a **pull request**

## Contact

* [@tbaranes](https://github.com/tbaranes/) on github

## License

SwiftyUtils is under the MIT license. See the [LICENSE](https://github.com/tbaranes/SwiftyUtils/blob/master/LICENSE) file for more information.
dic.testAll

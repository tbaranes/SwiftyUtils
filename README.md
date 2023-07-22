# SwiftyUtils

[![CI Status](https://travis-ci.org/tbaranes/SwiftyUtils.svg)](https://travis-ci.org/tbaranes/SwiftyUtils)
![Language](https://img.shields.io/badge/language-Swift%205.0-orange.svg)
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/SwiftyUtils.svg)](https://img.shields.io/cocoapods/v/SwiftyUtils.svg)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Platform](https://img.shields.io/cocoapods/p/SwiftyUtils.svg?style=flat)](http://cocoadocs.org/docsets/SwiftyUtils)

SwiftyUtils groups all the reusable code that we need to ship in each project. This framework contains:
- Extensions
- Protocols
- Structs
- Subclasses

Working on iOS, macOS, tvOS, and watchOS, everything has been made to be easy to use! :tada:

## Contents

Check out the repository to find examples / tests for each feature.

**Swift, Foundation and CoreGraphics extensions:**

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
 - [MutableCollection](#mutablecollection-extension)
 - [NotificationCenter](#notificationcenter-extension)
 - [NSAttributedString](#nsattributedstring-extension)
 - [NSLayoutConstraint](#nslayoutconstraint-extension)
 - [NSMutableAttributedString](#nsmutableattributedstring-extension)
 - [NSObject](#nsobject-extension)
 - [NSRange](#nsrange-extension)
 - [ReusableFormatters](#reusableformatters)
 - [Sequence](#sequence-extension)
 - [String](#string-extension)
 - [Timer](#timer-extension)
 - [URL](#url-extension)
 - [UserDefaults](#userdefaults-extension)


**SwiftUI:**

- [UIElementPreview](#uielementpreview)

**SwiftUI Extension:**

- [BindingExtension](#binding-extension)

**UIKit Extensions:**

- [UIAlertController](#uialertcontroller-extension)
- [UIApplication](#uiapplication-extension)
- [UIButton](#uibutton-extension)
- [UICollectionView](#uicollectionview-extension)
- [UICollectionViewCell](#uicollectionviewcell-extension)
- [UIDevice](#uidevice-extension)
- [UIFont](#uifont-extension)
- [UIImage](#uiimage-extension)
- [UILabel](#uilabel-extension)
- [UIScreen](#uiscreen-extension)
- [UISlider](#uislider-extension)
- [UIStoryboard](#uistoryboard-extension)
- [UISwitch](#uiswitch-extension)
- [UITableView](#uitableview-extension)
- [UITextField](#uitextfield-extension)
- [UITextView](#uitextview-extension)
- [UIView](#uiview-extension)
- [UIViewController](#uiviewcontroller-extension)

**UIKit Protocols:**

- [NibLoadable](#nibloadable)
- [NibOwnerLoadable](#nibownerloadable)

**AppKit Extensions:**

- [NSView](#nsview-extension)


**Protocols:**

- [Injectable](#injectable)
- [Occupiable](#occupiable)
- [Then](#then)

**PropertyWrappers:**

 - [UserDefaultsBacked](#userdefaultsbacked)

**Others:**

- [UnitTesting](#unittesting)
- [UITesting](#uitesting)
- [SystemUtility - Shell](#shell-utility)

## Swift, Foundation and CoreGraphics Extensions

### Array extension

Safely access to an element:

```swift
var array = [1, 2, 3]
print(array[safe: 0]) // Optional(1)
print(array[safe: 10]) // nil
```

Find all the index of an object:

```swift
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

### Bundle extension

Get bundle information:

```swift
Bundle.main.appName
Bundle(url: url)?.appName

Bundle.main.displayName
Bundle(url: url)?.displayName

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

```swift
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

### Data Extension

Initialize from hex string:

```swift
let hexString = "6261736520313020697320736F2062617369632E206261736520313620697320776865726520697427732061742C20796F2E"
let data = Data(hexString: hexString)
```

Get hex string from data:

```swift
let data = Data(...)
let string = data.toHexString()
// string = "6261736520313020697320736F2062617369632E206261736520313620697320776865726520697427732061742C20796F2E" if using previous example value
```

Get UInt8 Array from data:

```swift
let data = Data(...)
let array = data.bytesArray
```

Map Data to Dictionary:

```swift
let dictionary = try data.toDictionary()
```

### Date extension

Initialize from string:

```swift
let format = "yyyy/MM/dd"
let string = "2015/03/11"
print(Date(fromString: string, format: format)) // Optional("2015/03/11 00:00:00 +0000")
```

Convert date to string:

```swift
let now = Date()
print(now.string())
print(now.string(dateStyle: .medium, timeStyle: .medium))
print(now.string(format: "yyyy/MM/dd HH:mm:ss"))
```

See how much time passed:

```swift
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
print(now.isInFuture) // false
print(now.isInPast) // true
```

### Dictionary extension

Check if a key exists in the dictionary:

```swift
let dic = ["one": 1, "two": 2]
print(dic.has(key: "one")) // True
print(dic.has(key: "1")) // False
```

Map Dictionary to Data:

```swift
let data = try dictionary.toData()
```

Easily get union of two dictionaries:

```swift
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

```swift
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

```swift
print(Double(3.24).formattedPrice) // "$3.24"
print(Double(10).formattedPrice) // "$10.00"
```


### FileManager extension

Get documents directory url following the os:

```swift
FileManager.document
// OR
FileManager.default.document
```

Create a new directory:

```swift
FileManager.createDirectory(at: directoryUrl)
// OR
FileManager.default.createDirectory(at: directoryUrl)
```

Delete contents of temporary directory

```swift
FileManager.removeTemporaryFiles()
// OR
FileManager.default.removeTemporaryFiles()
```

Delete contents of documents directory

```swift
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

### MutableCollection extension

Sorts the mutable collection in place using `KeyPath`:

```swift
var articles = [Article(title: "B"), Article(title: "C"), Article(title: "A")]
articles.sort(by: \.title) // [A, B, C]
articles.sort(by: \.title, order: >) // [C, B, A]
```

### NotificationCenter extension

Post a notification from a specific queue:

```swift
NotificationCenter.default.postNotification("aNotification", queue: DispatchQueue.main) 
NotificationCenter.default.postNotification("aNotification", object: aObject queue: DispatchQueue.main)
NotificationCenter.default.postNotification("aNotification", object: aObject userInfo: userInfo queue: DispatchQueue.main)
```

### NSAttributedString extension

Check if an attribute is applied on the desired substring:

```swift
let text = "Hello"
let attrString = NSMutableAttributedString(text: "Hello world")
attrString = attrString.underlined(occurences: text)
attrString.isAttributeActivated(.underlineStyle, appliedOn: text, value: 1) // true
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

### Sequence extension

Sort a sequence using `keyPath`:

```swift
let articles = [Article(title: "B"), Article(title: "C"), Article(title: "A")]
var sortedArticles = articles.sorted(by: \.title) // [A, B, C]
sortedArticles = articles.sorted(by: \.title, order: >) // [C, B, A]
```

### String extension

Access with subscript:

```swift
var string = "hello world"
print(string[0]) // h
print(string[2]) // l
print(string[Range(1...3)]) // ell
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
// (deprecated)
var string = "test@gmail.com"
print(string.isEmail) // true
var string = "test@"
print(string.isEmail) // false
```

```swift
// current
var support = try "test@gmail.com".validateEmailAddress() // EmailSupport.widelySupported
string = try "test+tag@gmail.com".validateEmailAddress() // EmailSupport.mostlySupported
string = try "\"abc@def\"@gmail.com".validateEmailAddress() // EmailSupport.technicallySupported
string = try "test@".validateEmailAddress() // throws an error for lack of a domain
```

Check it's a valid domain:
```swift
try "google.com".validateDomain() // doesn't throw
try "google..com".validateDomain() // throws because of sequential dots in value
```

Check if it's a valid IP address:

```swift
let ip4 = "1.2.3.4"
let ip6 = "fc00::"
let notIPAtAll = "i'll bribe you to say i'm an ip address!"

ip4.isIP4Address //true
ip4.isIP6Address //false
ip4.isIPAddress //true

ip6.isIP4Address //false
ip6.isIP6Address //true
ip6.isIPAddress //true

notIPAtAll.isIP4Address //false
notIPAtAll.isIP6Address //false
notIPAtAll.isIPAddress //false
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

### Timer extension

Schedule timer every seconds:

```swift
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

```swift
Timer.after(2.seconds) { _ in
    print("Prints this 2 seconds later in main queue")
}
```

Manual scheduling a timer:

```swift
let timer = Timer.new(every: 2.seconds) { _ in
    print("Prints this 2 seconds later in main queue")
}
timer.start(onRunLoop: RunLoop.current, modes: RunLoopMode.defaultRunLoopMode)
```

Manual scheduling a timer with a delay:

```swift
let timer = Timer.new(after: 2.seconds) { _ in
    print("Prints this 2 seconds later in main queue")
}
timer.start(onRunLoop: RunLoop.current, modes: RunLoopMode.defaultRunLoopMode)
```

### URL extension

Get query parameters from URL:

```swift
let url = URL(string: "http://example.com/api?v=1.1&q=google")
let queryParameters = url?.queryParameters
print(queryParameters?["v"]) // 1.1
print(queryParameters?["q"]) // google
print(queryParameters?["other"]) // nil
```

Add skip backup attributes to you URL:

```swift
let url = URL(string: "/path/to/your/file")        
url?.addSkipBackupAttribute() // File at url won't be backupped!
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


## SwiftUI

### UIElementPreview

Generate automatically multiple previews including: 

- Default sized preview or dedicated preview device
- A preview with Dark Mode enabled
- Each localization of our project applied to a preview
- Different dynamic type sizes applied


```swift
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        UIElementPreview(ContentView(),
                         previewLayout: .sizeThatFits, // default is `.device`
                         previewDevices: ["iPhone SE"], // default is iPhone SE and iPhone XS Max. Note: it won't be used if `previewLayout` is `.sizeThatFits`
                         dynamicTypeSizes:[.extraSmall] // default is: .extraSmall, .large, .extraExtraExtraLarge
                        )
    }
}
```

## SwiftUI Extensions

### Binding extension

Pass an interactive value that’ll act as a preview stand-in for a binding:

```swift
struct MyButton: View {
    @Binding var isSelected: Bool
    // ...
}

struct MyButton_Previews: PreviewProvider {
    static var previews: some View {
        MyButton(isSelected: .mock(true))
    }
}
```

## UIKit Extensions

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

Open app settings:

```swift
UIApplication.shared.openAppSettings()
```

Open app review page:

```swift
let url = URL(string: "https://itunes.apple.com/app/{APP_ID}?action=write-review")
UIApplication.shared.openAppStoreReviewPage(url)
```

### UIButton extension

Add right image with custom offset to button:

```swift
let button = UIButton(frame: .zero)
button.addRightImage(image, offset: 16)
```

### UICollectionView extension

Register and dequeue safely your `UICollectionViewCell`:

```swift
// 1. Make your `UICollectionCell` conforms to `Reusable` (class-based) or `NibReusable` (nib-based)
final class ReusableClassCollectionViewCell: UICollectionViewCell, Reusable {}
// 2. Register your cell:
collectionView.register(cellType: ReusableClassCollectionViewCell.self)
// 3. Dequeue your cell:
let cell: ReusableClassCollectionViewCell = collectionView.dequeueReusableCell(at: indexPath)
```

Register and dequeue safely your `UICollectionReusableView`:

```swift
// 1. Make your `UICollectionReusableView` conforms to `Reusable` (class-based) or `NibReusable` (nib-based)
final class ReusableNibCollectionReusableView: UICollectionReusableView, NibReusable
// 2. Register your cell:
collectionView.register(supplementaryViewType: ReusableNibCollectionReusableView.self, ofKind: UICollectionView.elementKindSectionHeader)
// 3. Dequeue your cell:
let header: ReusableNibCollectionReusableView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, at: indexPath)
```

### UICollectionViewCell extension

Apply a corner radius to the cell:

```swift
let cell = UICollectionViewCell()
cell.applyCornerRadius(10)
```

Animate when cell is highlighted:

```swift
class MyCollectionViewCell: UICollectionViewCell {
    // ...
    override var isHighlighted: Bool {
        willSet {
            self.animate(scale: newValue, options: .curveEaseInOut) // Note that the animation is customisable, but all parameters as default value
        }
    }
    // ...
}
```

### UIFont extension

Obtains a font that scale to support Dynamic Type:

```swift
let font = UIFont.dynamicStyle(.body, traits: .traitsBold)
```

### UIDevice extension

Access to your device information:

```swift
print(UIDevice.idForVendor) // 104C9F7F-7403-4B3E-B6A2-C222C82074FF
print(UIDevice.systemName()) // iPhone OS
print(UIDevice.systemVersion()) // 9.0
print(UIDevice.deviceName) // iPhone Simulator / iPhone 6 Wifi
print(UIDevice.deviceLanguage) // en
print(UIDevice.isPhone) // true or false
print(UIDevice.isPad) // true or false
```

Check your system version:

```swift
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

Configure a dynamic text style to the label:

```swift
label.configureDynamicStyle(.body, traits: .traitBold)
```

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
if UIInterfaceOrientationIsPortrait(UIScreen.currentOrientation) {
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

### UISlider extension

Get the value where the user tapped using an `UITapGestureRecognizer`:

```
let slider = UISlider(frame: .zero)
slider.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(sliderTapped(_:))))

func sliderTapped(sender: UITapGestureRecognizer) {
    let value = slider.value(for: sender)
}
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

### UITableView

Register and dequeue safely your `UITableViewCell`:

```swift
// 1. Make your `UITableViewCell` conforms to `Reusable` (class-based) or `NibReusable` (nib-based)
final class ReusableClassTableViewCell: UITableViewCell, Reusable {}
// 2. Register your cell:
tableView.register(cellType: ReusableClassTableViewCell.self)
// 3. Dequeue your cell:
let cell: ReusableClassTableViewCell = tableView.dequeueReusableCell(at: indexPath)
```

Register and dequeue safely your `UITableViewHeaderFooterView`:

```swift
// 1. Make your `UITableViewHeaderFooterView` conforms to `Reusable` (class-based) or `NibReusable` (nib-based)
final class ReusableClassHeaderFooterView: UITableViewHeaderFooterView, Reusable {}
// 2. Register your header or footer:
tableView.register(headerFooterViewType: ReusableClassHeaderFooterView.self)
// 3. Dequeue your header or footer:
let cell: ReusableClassHeaderFooterView = tableView.dequeueReusableHeaderFooterView()
```

### UITextField extension

Configure a dynamic text style to the textfield:

```swift
textField.configureDynamicStyle(.body, traits: .traitBold)
```

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

### UITextView extension

Configure a dynamic text style to the textfield:

```swift
textView.configureDynamicStyle(.body, traits: .traitBold)
```

### UIView extension

Change the frame of the view easily:

```swift
let aView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
aView.x += 100 // move  to right
aView.y += 100 // move downwards
aView.width -= 10 // make the view narrower
aView.height -= 10 // make the view shorter 
```

Apply a corner radius to the view:

```swift
let view = UIView()
view.applyCornerRadius(10)
view.applyCornerRadius(20, maskedCorners: [.layerMaxXMaxYCorner])
```

Find the `ViewController` which contains this view:

```swift
let parent: UIViewController? = aView.parentViewController
```

Find a subview using its `accessibilityIdentifier, useful to tests private outlets:

```swift
aView.findView(forIdentifier: "accessibilityIdentifier")
```

Find the first subview corresponding to a  specific type:

```swift
let scrollView: UIScrollView? = aView.findView()
```

Add a SwiftUI `View` as a subview:

```swift
aView.addSubSwiftUIView(SwiftUIView())
```

Automates your localizables:

```swift
aView.translateSubviews()
```

It will iterate on all the subviews of the view, and use the text / placeholder as key in `NSLocalizedString`.
By settings your localizable key in your xib / storyboard, all yours string will be automatically translated just by calling the above method.

Add constraints between a view and its superview:

```swift
aView.addConstraints() // Add constraints to all edges with zero insets
aView.addConstraints(to: [.top, .bottom]) // Add constraints to top and bottom edges with zero insets
aView.addConstraints(to: [.top, .left], insets: UIEdgeInsets(top: 10, left: 20, bottom: 0, right: 0)) // Add constraints to top and left edges with custom insets
```

### UIViewController extension

Generate a Xcode preview for any view controllers:

```swift
@available(iOS 13, *)
struct MyViewPreview: PreviewProvider {
    static var previews: some View {
        MyViewController().preview
    }
}
```

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

Check if ViewController is presented modally:

```swift
let viewController = UIViewController()
print(viewController.isModal)
```

Open Safari modally:

```
let url = URL(string: "https://www.apple.com")
vc.openSafariVC(url: url, delegate: self)
```

Add a child view controller to another controller:

```swift
vc.addChildController(childVC, subview: vc.view, animated: true, duration: 0.35, options: [.curveEaseInOut, .transitionCrossDissolve])
```

Add a child view controller to a container view:

```swift
vc.addChildController(childVC, in: containerView)
```

Remove a child view controller:

```swift
vc.removeChildController(childVC)
```

Add a SwiftUI `View` as a child of the input `UIView`:

```swift
vc.addSubSwiftUIView(SwiftUIView(), to: vc.view)
```

## UIKit Protocols:

### NibLoadable

Make your `UIView` subclasses conform to this protocol to instantiate them from their NIB safely.
**Note:** Be sure that your `UIView` is based on a Nib, and is used as the Xib's root view.

```swift
class NibLoadableView: UIView, NibLoadable {
    // ...
}

let view = NibLoadableView.loadFromNib()
```

### NibOwnerLoadable

Make your `UIView` subclasses conform to this protocol to instantiate them from their Xib's File Owner safely.
**Note:** Be sure that your `UIView` is based on a Nib, and is used as the Xib's File's Owner.

```swift
class NibLoadableView: UIView, NibOwnerLoadable {
    // ...
    
    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      self.loadNibContent()
    }

}

// Then use it directly from another xib or whatever...
```

## AppKit, Cocoa Extensions

### NSView extension

Change the frame of the view easily

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

## Protocols

### Injectable

Protocol to do `ViewController` Data Injection with Storyboards and Segues in Swift. Inspired from [Nastasha's blog](https://www.natashatherobot.com/update-view-controller-data-injection-with-storyboards-and-segues-in-swift/):

```swift
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

## PropertyWrappers

### UserDefaultsBacked

Type safe access to UserDefaults with support for default values.

```swift
struct SettingsViewModel {
    @UserDefaultsBacked(key: "search-page-size", defaultValue: 20)
    var numberOfSearchResultsPerPage: Int

    @UserDefaultsBacked(key: "signature")
    var messageSignature: String?
}
```

## Others

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

```swift
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

### Shell Utility 
(macOS only)

Runs a command on a system shell and provides the return code for success, STDOUT, and STDERR.

STDOUT as one continuous String:

```swift
let (rCode, stdOut, stdErr) = SystemUtility.shell(["ls", "-l", "/"])
// rCode = 0 (which is "true" in shell)
// stdOut = "total 13\ndrwxrwxr-x+ 91 root  admin  2912 Feb 11 01:24 Applications" ...  etc
// stdErr = [""]
```

STDOUT as array of Strings separated by newlines:

```swift
let (rCode, stdOut, stdErr) = SystemUtility.shellArrayOut(["ls", "-l", "/"])
// rCode = 0 (which is "true" in shell)
// stdOut = ["total 13", "drwxrwxr-x+ 91 root  admin  2912 Feb 11 01:24 Applications" ...  etc]
// stdErr = [""]
```


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

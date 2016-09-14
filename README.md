# SwiftyUtils

[![CI Status](https://travis-ci.org/tbaranes/SwiftyUtils.svg)](https://travis-ci.org/tbaranes/SwiftyUtils)
![Language](https://img.shields.io/badge/language-Swift%203.0-orange.svg)
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/SwiftyUtils.svg)](https://img.shields.io/cocoapods/v/SwiftyUtils.svg)
[![Platform](https://img.shields.io/cocoapods/p/SwiftyUtils.svg?style=flat)](http://cocoadocs.org/docsets/SwiftyUtils)
[![License](https://img.shields.io/cocoapods/l/SwiftyUtils.svg?style=flat)](http://cocoapods.org/pods/SwiftyUtils)

SwiftyUtils groups all the reusable code that we need to ship in each project. This framework contains:
- extension
- Protocols
- Structs
- Subclasses

Working on iOS, macOS, tvOS, and watchOS, everything has been made to be easy to use! :tada:

## Contents

Check out the repository to find examples / tests for each feature.

**Available for iOS, macOS, tvOS and watchOS:**

- [Int](#int-extension)
- [Double](#double-extension)
- [String](#string-extension)
- [Array](#array-extension)
- [Dictionary](#dictionary-extension)
- [CollectionType](#collectiontype-extension)
- [MutableCollectionType](#mutablecollectiontype-extension)
- [NSObject](#nsobject-extension)
- [NSDate](#nsdate-extension)
- [Timer](#timer-extension)
- [URL](#url-extension)
- [UIColor / NSColor](#color-extension)
- [UserDefaults](#userdefaults-extension)
- [FileManager](#filemanager-extension)
- [NSLayoutConstraint](#nslayoutconstraint-extension)
- [NSMutableAttributedString](#nsmutableattributedstring-extension)
- [NSRange](#nsrange-extension)
- [Bundle](#bundle-extension)
- [NotificationCenter](#notificationcenter-extension)
- [BlockNotification](#blocknotification)
- [ReusableFormatters](#reusableformatters)
- [UITesting](#uitesting)
- [UnitTesting](#unittesting)
- **Protocols:**
 - [Injectable](#injectable)
 - [Occupiable](#occupiable)
 - [Then](#then)

**Available for iOS:**

- [UIView](#uiview-extension)
- [UIImage](#uiimage-extension)
- [UIDevice](#uidevice-extension)
- [UIScreen](#uiscreen-extension)
- [UIViewController](#uiviewcontroller-extension)
- [UIAlertController](#uialertcontroller-extension)
- [UIApplication](#uiapplication-extension)
- [UIStoryboard](#uistoryboard-extension)
- [UISwitch](#uiswitch-extension)
- [Simulator](#simulator)
- **Gestures:**
 - [BlockTapGesturesRecognizers](#blocktapgesturesrecognizers)
 - [BlockLongPressGesturesRecognizers](#blocklongpressgesturesrecognizers)
 - [BlockSwipeGesturesRecognizers](#blockswipegesturesrecognizers)
 - [BlockPanGesturesRecognizers](#blockpangesturesrecognizers)
 - [BlockPinchGesturesRecognizers](#blockpinchgesturesrecognizers)

## Available for iOS, macOS, tvOS and watchOS

### Int extension

```swift
var myNumber = -33
print(myNumber.isEven) // false
print(myNumber.isOdd) // true
print(myNumber.isPositive) // false
print(myNumber.isNegative) // true
print(myNumber.digits) // 2
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

### String extension

Get the length of a string:

```swift
var aString = "hello world"
print(aString.length) // 11
```

Access with subscript:

```swift
var aString = "hello world"
print(aString[0]) // h
print(aString[2]) // l
print(aString[1...3]) // ell
```

Create a string from Float or Double with max digits:

```swift
let aString = String(value: 2.323232, maxDigits: 2)
print(aString) // 2.32
```

Check if it contains a string:

```swift
let aString = "Hello world"
print (aString.contains(text: "hello")) // true
print (aString.contains(text: "hellooooo")) // false
```

Capitalize the first letter:

```swift
var aString = "hello world"
aString = aString.capitalizeFirst
print(aString)// Hello world
```

Check if it's composed only of spaces and new lines:

```swift
var aString = "  \n  "
print(aString.isOnlyEmptySpacesAndNewLineCharacters()) // true
var aString = "test"
print(aString.isOnlyEmptySpacesAndNewLineCharacters()) // false
```

Trimmed spaces and new lines:

```swift
var aString = " I'  am a    test  \n  "
print(aString.trim()) // I'am a test
```

Truncated to have a limit of characters:

```swift
var aString = "0123456789aaaa"
print(aString.truncate(limit: 10)) // 0123456789...
```
Check if it's a number:

```swift
var aString = "4242"
print(aString.isNumber()) // true
var aString = "test"
print(aString.isNumber) // false
```

Check if it's a valid email:

```swift
var aString = "test@gmail.com"
print(aString.isEmail) // true
var aString = "test@"
print(aString.isEmail) // false
```

Extracts URLs:

```swift
let string = "http://google.com http fpt:// http://facebook.com test"
print(aString.extractURLs) // [http://google.com, http://facebook.com]
```

### Array extension

Access to a random element:

``` swift
var myArray = [1, 2, 3]
print(myArray.random()) // 2 or something else
```

Find the indexes of an object:

``` swift
var myArray = [1, 2, 3, 1]
print(myArray.indexes(of: 1)) // [0,3]
```

Get index of last occurrence of an object:

``` swift
var myArray = [1, 2, 3, 1]
print(myArray.lastIndex(of: 1)) // 3
```

Remove an object:

``` swift
var myArray = [1, 2, 3]
myArray.remove(object: 2)
print(myArray) // [1, 3]
myArray.remove(objects: [1, 3])
print(myArray) // []
```

Check if an array contains instance of an object:

``` swift
var myArray = [1, 2, 3]
print(myArray.contains(instanceOf: 1)) // true
print(myArray.contains(instanceOf: "1")) // false
```

Check if an array contains another array:

``` swift
var myArray = [1, 2, 3]
print(myArray.contains(array: [1, 2])) // true
print(myArray.contains(array: [5])) // false
```

Get an object at a specified index:

``` swift
var myArray = [1, 2, 3]
print(myArray.get(index: 1)) // 2
```

Determine if an array contains an object:

``` swift
var myArray = [1, 2, 3]
print(myArray.contains(1)) // true
print(myArray.contains(11)) // false
```

Get intersection and union of two arrays:

``` swift
var myArray = [1, 2, 3]
print(myArray.intersection(for: [1, 5, 3])) // [1, 3]
print(myArray.union(values: [5, 6])) // [1, 2, 3, 5, 6]
```

Get difference between two arrays:

``` swift
var myArray = [1, 2, 3]
print(myArray.difference(with: [1])) // [2, 3]
```

Test all elements of an array against a closure:

``` swift
var myArray = [1, 2, 3]
let result = myArray.testAll {
	$0 == 1
}
print(result) // false
```

### Dictionary extension

Check if a key exists in the dictionary:

``` swift
let dic1 = ["one": 1, "two": 2]
print(myDict.has(key: "one")) // True
print(myDict.has(key: "1")) // False
```

Access a random element:

``` swift
let dic1 = ["one": 1, "two": 2]
print(myDict.random()) // 1 or something else
```

Add dictionaries to create new ones:

``` swift
let dic1 = ["one": 1]
let dic2 = ["three": 3]

dictionary1 += dictionary2
print(dictionary1) // ["one": 1, "three": 3]
```

Easily get union of two dictionaries:

``` swift
let dic1 = ["one": 1, "two": 2]
let dic2 = ["one": 1, "four": 4]

let dictionary3 = dictionary1.union(values: dictionary2)
print(dictionary3) // ["one": 1, "two": 2, "four": 4]
```

Get difference of two dictionaries:

``` swift
let dic1 = ["one": 1, "two": 2]
let dic2 = ["one": 1, "four": 4]
difference(with: dictionary1, dictionary2) // ["two": 2, "four": 4]
```

Merge several dictionaries:

```swift
let dic1 = ["one": 1, "two": 2]
let dic2 = ["three": 3, "four": 4]
var finalDic: Dictionary<String, Int> = [:]
finalDic.merge(with: dic1, dic2)
print(finalDic) // ["one": 1, "two": 2, "three": 3, "four": 4]
```

### CollectionType extension

Shuffle a collection:

``` swift
let myArray = [1, 2, 3, "5", "6]
let arraySuffled = myArray.shuffle()
print(arraySuffled) // [3, "6", 1, 2, "5"]
```

### MutableCollectionType extension

Shuffle a collection:

``` swift
var myArray = [1, 2, 3, "5", "6]
myArray.shuffle()
print(newArray) // [3, "6", 1, 2, "5"]
```

### NSObject extension

Get the class name of a `NSObject`:

```swift
let vc = UIViewController()
print(vc.className) // UIViewController
print(UIViewController.className) // UIViewController
```

## NSDate extension

Initialize from string:

``` swift
let format = "yyyy/MM/dd"
let fromString = "2015/03/11"
print(NSDate(fromString: fromString, format: format)) // Optional("2015/03/11 00:00:00 +0000")
```

Convert date into string:

``` swift
let now = NSDate()
print(now.toString())
print(now.toString(dateStyle: .MediumStyle, timeStyle: .MediumStyle))
print(now.toString(format: "yyyy/MM/dd HH:mm:ss"))
```

See how much time passed:

``` swift
let now = NSDate()
let later = NSDate(timeIntervalSinceNow: -100000)
print(later.daysInBetweenDate(now)) // 1.15740740782409
print(later.hoursInBetweenDate(now)) // 27.7777777733571
print(later.minutesInBetweenDate(now)) // 1666.66666641732
print(later.secondsInBetweenDate(now)) // 99999.999984026
```

Check if dates are equal:

``` swift
let now = NSDate()
let now2 = NSDate()
print(now == now2) // false
```

Check which date is larger:

``` swift
let now = NSDate()
let now2 = NSDate()
print(now < now2) // true
print(now2 < now) // false  
```

## Timer extension

Schedule timer every seconds:

``` swift
var count = 0
Timer.every(1.seconds) { (timer: NSTimer) in
    print("Will print every second")
    if count == 3 {
        timer.invalidate()
    }
    count++
}
```

Schedule timer after a certain delay:

``` swift
Timer.after(2.seconds) {
    print("Prints this 2 seconds later in main queue")
}
```

Manual scheduling a timer:

``` swift
let timer = Timer.new(every: 2.seconds) {
    print("Prints this 2 seconds later in main queue")
}
timer.start
```

Manual scheduling a timer with a delay:

``` swift
let timer = Timer.new(after: 2.seconds) {
    print("Prints this 2 seconds later in main queue")
}
timer.start
```

### URL extension

Put query in a Dictionary:

``` swift
let url = URL(string: "http://example.com/api?v=1.1&q=google")
if let queryParameters = url?.queryParameters {
    print(queryParameters["v"]) //Optional("1.1")
    print(queryParameters["q"]) //Optional("google")
    print(queryParameters["other"]) //nil
}
```

Add skip backup attributes to you URL:

``` swift
let url = URL(string: "/path/to/your/file")        url?.addSkipBackupAttribute() // File at url won't be backupped!
```

### Color extension

Create colors with HEX values:

``` swift
let myUIColor = UIColor(hex: 0x233C64) // Equals 35,60,100,1
let myNSColor = NSColor(hex: 0x233C64) // Equals 35,60,100,1
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

### UserDefaults extension

Get and set values from UserDefaults with subscripts:

```swift
let Defaults = UserDefaults.standard()
Defaults["userName"] = "test"
print(Defaults["userName"]) // test
```

Check if the userdefaults contains a key:

```swift
UserDefaults.contains("aKey")
// OR
UserDefaults.standard().contains("aKey")
```

Reset the defaults:

```swift
UserDefaults.standard().reset()
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
FileManager.default().createDirectory(at: directoryUrl)
```

Delete contents of temporary directory

```
FileManager.deleteAllTemporaryFiles()
// OR
FileManager.default().deleteAllTemporaryFiles()
```

Delete contents of documents directory

```
FileManager.deleteAllDocumentFiles()
// OR
FileManager.default().deleteAllDocumentFiles()
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
let attrStr: NSMutableAttributedString = NSMutableAttributedString.setTextcolor("hello world", color: UIColor.yellowColor(), forOccurences: "llo")

// OR

let attrStr: NSMutableAttributedString = NSMutableAttributedString(string: "Hello world")
attrStr.setTextColor(UIColor.yellowColor(), forOccurences: "llo")
```

Colorize everything after an occurence:

```swift
let attrStr = NSMutableAttributedString.setTextcolor("Hello world", color: UIColor.yellowColor(), afterOcurrence: "llo")

// OR

let attrStr = NSMutableAttributedString(string: "Hello world")
attrStr.setTextColor(UIColor.yellowColor(), afterOcurrence: "llo")
```

Strike each occurence:

```swift
let attrStr: NSMutableAttributedString = NSMutableAttributedString.setTextStrike("Hello world", forOccurences: "llo")

// OR

let attrStr = NSMutableAttributedString(string: "Hello world")
attrStr.setTextStrike(forOccurences: "llo")
```

Strike everything after an occurence:

```swift
let attrStr: NSMutableAttributedString = NSMutableAttributedString.setTextStrike("Hello world", afterOcurrence: "llo")

// OR

let attrStr = NSMutableAttributedString(string: "Hello world")
attrStr.setTextStrike(afterOcurrence: "llo")
```

Underline each occurence:

```swift
let attrStr: NSMutableAttributedString = NSMutableAttributedString.setTextUnderline("Hello world", forOccurences: "llo")

// OR

let attrStr = NSMutableAttributedString(string: "Hello world")
attrStr.setTextUnderline(forOccurences: "llo")
```

Underline everything after an occurence:

```swift
let attrStr: NSMutableAttributedString = NSMutableAttributedString.setTextUnderline("Hello world", afterOcurrence: "llo")

// OR

let attrStr = NSMutableAttributedString(string: "Hello world")
attrStr.setTextUnderline(afterOcurrence: "llo")
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

### NSBundle extension

Get bundle information:

```swift
Bundle.main.appName
Bundle(URL: someURL)?.appName

Bundle.main.appVersion
Bundle(URL: someURL)?.appVersion

Bundle.main.appBuild
Bundle(URL: someURL)?.appBuild

Bundle.main.bundleId
Bundle(URL: someURL)?.bundleId

Bundle.main.schemes
Bundle(URL: someURL)?.schemes

Bundle.main.mainScheme
Bundle(URL: someURL)?.mainScheme
```

Get the app build:

```swift
NSBundle(URL: someURL)?.appBuild
NSBundle.mainBundle().appBuild
```

### NotificationCenter extension

Post a notification from a specific queue:

```
NotificationCenter.default().postNotification(name: "aNotification", queue: DispatchQueue.main) 
NotificationCenter.default().postNotification(name: "aNotification", object: aObject queue: DispatchQueue.main)
NotificationCenter.default().postNotification(name: "aNotification", object: aObject userInfo: userInfo queue: DispatchQueue.main)
```

### BlockNotification

```swift
// Register a notification
let notificationProxy = BlockNotification("aNotificationName": name) { notification in
	print("notification received: \(notification.object))
}

// Post a notification
NotificationCenter.default().postNotificationName("aNotificationName", object: "Hello world")
```

### ReusableFormatters

Reuse your formatter to avoid heavy allocation:

```swift
SUDateFormatter.sharedInstance
SUNumberFormatter.sharedInstance
SUByteCountFormatter.sharedInstance
SUDateComponentsFormatter.sharedInstance
SUDateIntervalFormatter.sharedInstance
SUEnergyFormatter.sharedInstance
SUMassFormatter.sharedInstance
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

### Injectable

Portocol to do `ViewController` Data Injection with Storyboards and Segues in Swift. Inspired from [Nastasha's blog](https://www.natashatherobot.com/update-view-controller-data-injection-with-storyboards-and-segues-in-swift/):

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

### Selfie

Log your classes's members and values when making a `description`, like Value types:

```
class MyModel: Selfie {
	let property1 = "I'm a property"
	let property2 = 100
}

print(MyModel().description) // MyModel(property1: "I'm a property", property2: 100)
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

## Available on iOS

### UIView extension

**Automates your localizables**

```swift
aView.convertLocalizables()
```

It will iterate on all the subviews of the view, and use the text / placeholder as key in `NSLocalizedString`.
By settings your localizable key in your xib / storyboard, all yours string will be automatically translated just by calling the above method.

**Instantiate view from nib programatically**

```swift
let myCustomView: CustomView = UIView.fromNib()
// or
let myCustomView = UIView.fromNib() as? CustomView
```
### UIDevice extension

Access to your device information:

``` swift
print(UIDevice.idForVendor()) // 104C9F7F-7403-4B3E-B6A2-C222C82074FF
print(UIDevice.systemName()) // iPhone OS
print(UIDevice.systemVersion()) // 9.0
print(UIDevice.deviceName()) // iPhone Simulator / iPhone 6 Wifi
print(UIDevice.deviceLanguage()) // en
```

Check your system version:

``` swift
print(UIDevice.isVersion(8.1)) // false
print(UIDevice.isVersionOrLater(8.1)) // true
print(UIDevice.isVersionOrEarlier(8.1)) // false
```

Force device orientation:

```swift
UIDevice.forceRotation(.Portrait)
// or
UIDevice.mainDevice().setValue(orientation.rawValue, forKey: "orientation")
```

### UIImage extension

Create an image from a color:

```swift
let image = UIImage(color: UIColor.greenColor())
```

Change the rendering mode:

```swift
var image = UIImage(...)
image = image.template // imageWithRenderingMode(.AlwaysTemplate)
image = image.original // imageWithRenderingMode(.AlwaysOriginal)
```

Fill an image with a color:

```
let image = UIImage(named: "anImage")
let greenImage = image.filled(with: UIColor.greenColor())
```

### UIScreen extension

Get the screen orientation:

```swift
if UIInterfaceOrientationIsPortrait(UIScreen.screenOrientation())) {
	// Portrait
} else {
	// Landscape
}
```

Get the screen size:

```swift
print(UIScreen.currentSize) // CGSize(375.0, 667.0) on iPhone6
print(UIScreen.screenWidth) // 375.0 on iPhone6
print(UIScreen.screenHeight) // 667.0 on iPhone6
print(UIScreen.screenHeightWithoutStatusBar) // 647.0 on iPhone6
```

Get the status bar height:

```swift
print(UIScreen.screenStatusBarHeight) // 20.0 on iPhone6
```

### UIViewController extension

Reset the navigation stack by deleting previous view controllers:

```swift
        let navController = UINavigationController()
        navController.pushViewController(vc1, animated: true)
        navController.pushViewController(vc2, animated: true)
        navController.pushViewController(vc3, animated: true)
        vc3.deletePreviousViewControllers(true)
        print(navController.viewControllers) // [vc3]
```


Setup your navigation bar:

```swift
let vc = UIViewController()
vc.setupBackButton(title: String = "Example", tintColor: UIColor.blueColor())
vc.setupRightBarView(aView)

let vc2 = UIViewController()
vc2.setupBackButton(hidden: false)
vc2.setupBar(leftView:  aView)
vc2.setupBar(rightView: aView)
```

### UIAlertController extension

Show a basic alert:

```swift
UIAlertController.show(title: "Title", message: "Message")
UIAlertController.show(title: "Title", message: "Message", cancelTitle: "Custom cancel title")
```

### UIApplication extension

Get the current view controller display:

```swift
UIApplication.sharedApplication().topViewController()
```

### UIStoryboard extension

Get the application's main storyboard:

```swift
let storyboard = UIStoryboard.main
```

### UISwitch extension

Toggle a switch state:

```swift
let mySwitch = UISwitch()
mySwitch.toggle()
```

### Simulator

Check if you are running on a simulator:

```swift
if !Simulator.isRunning {
  // add device specific operations here
}
```

### BlockTapGesturesRecognizers

```swift
let blockTapGesture = BlockTapGestureRecognizer() { _ in
   print("tap gesture detected")
}
view.addGestureRecognizer(blockTapGesture)

// OR

let blockTapGesture = BlockTapGestureRecognizer(numberOfTapsRequired: 1, numberOfTouchesRequired: 1) { _ in
   print("tap gesture detected")
}
view.addGestureRecognizer(blockTapGesture)
```

### BlockLongPressGesturesRecognizers

```swift
let longPressGesture = BlockLongPressGestureRecognizer() { _ in
	print("long press gesture detected")
}
view.addGestureRecognizer(longPressGesture)

// OR

let longPressGesture = BlockLongPressGestureRecognizer(numberOfTapsRequired: 0, numberOfTouchesRequired: 1, minimumPressDuration: 0.5) { _ in
	print("long press gesture detected")
}
view.addGestureRecognizer(longPressGesture)
```

### BlockSwipeGesturesRecognizers

```swift
let swipeDownGesture = BlockSwipeGestureRecognizer(direction: .Down) { _ in
	print("swipe gesture detected")
}
view.addGestureRecognizer(swipeDownGesture)

// OR

let swipeDownGesture = BlockSwipeGestureRecognizer(numberOfTouchesRequired: 1, direction: .Down) { _ in
	print("swipe gesture detected")
}
view.addGestureRecognizer(swipeDownGesture)
```

### BlockPanGesturesRecognizers

```swift
let panGesture = BlockPanGestureRecognizer() { _ in
	print("pan gesture detected"
}
view.addGestureRecognizer(panGesture)

// OR

let panGesture = BlockPanGestureRecognizer(minimumNumberOfTouches: 1) { _ in
	print("pan gesture detected"
}
view.addGestureRecognizer(panGesture)
```

### BlockPinchGesturesRecognizers

```swift
let pinchGesture = BlockPinchGestureRecognizer { _ in
	print("pinch gesture detected"
}
viewPinchGesture.addGestureRecognizer(pinchGesture)     
```

## Installation

- Xcode 8 and later
- iOS 8.0 or later
- macOS 10.10 or later
- tvOS 9.0 or later
- watchOS 2.0 or later

### Manually

Copy the SwiftyUtils folder into your Xcode project. (Make sure you add the files to your target(s))

### CocoaPods

Add `pod SwiftyUtils` to your Podfile.

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

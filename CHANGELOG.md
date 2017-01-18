# Changelog

All notable changes to the project will be documented in this file.

---

## Next

#### API breaking changes

N/A

#### Enhancements

#### Enhancements

*Note: Take a look into the README to see the details of all the following enhancements* 

- UITextFieldExtension (iOS only)

```swift
public func setClearButton(with image: UIImage)
```


#### Bugfixes

N/A

## [0.7.0](https://github.com/tbaranes/SwiftyUtils/releases/tag/0.7.0) (15-01-2017)

#### API breaking changes

- Some APIs have been updated to follow the Swift 3 API guidelines, check out the README for more information

#### Enhancements

*Note: Take a look into the README to see the details of all the following enhancements* 

- UILabelExtension (iOS only)

```swift
public func setLineHeight(_ lineHeight: CGFloat)
```

- CGRectExtension

```swift
public var x: CGFloat
public var y: CGFloat
public func with(x: CGFloat) -> CGRect
public func with(y: CGFloat) -> CGRect
public func with(width: CGFloat) -> CGRect
public func with(height: CGFloat) -> CGRect
public func with(origin: CGPoint) -> CGFloat
public func with(size: CGSize) -> CGFloat
```

- UIViewExtension and NSViewExtension

```swift
public var x: CGFloat
public var y: CGFloat
public var width: CGFloat
public var height: CGFloat
```

## [0.6.0](https://github.com/tbaranes/SwiftyUtils/releases/tag/0.6.0) (18-11-2016)

#### API breaking changes

- `NSDate` is now used as `Date`

#### Enhancements

*Note: Take a look into the README to see the details of all the following enhancements* 

**New protocols available:**

- Iteratable

**New extensions:**

- CGFloatLiteral (Integer / Float extension):

```
public var f: CGFloat
```

- Array

```swift
subscript(safe index: Int) -> Element?
```

- Sugar syntax for `Date`

```swift
Too many things to be described here... check the README
```

- UILabelExtension (iOS only)

```swift
func isTruncated() -> Bool
func setText(_ text: String, truncatedText: String)
```

**New extensions for macOS:**

- NSView:

```swift
func convertLocalizables()
```

## [0.5.0](https://github.com/tbaranes/SwiftyUtils/releases/tag/0.5.0) (14-09-2016)

#### API breaking changes

- Swift 3 support. README is up to date, please report if you find any diffs
- Some APIs have been updated to be more swifty, check out the README for more information

**Classes removed:**

- Async

**Extensions removed:**

- {UI/NS}Color: 

```
convenience init(hex: String, alpha: Float)
```

- UIDevice: 

```
class func deviceModel() -> String
```

#### Enhancements

*Note: Take a look into the README to see the details of all the following enhancements* 

- watchOS support

**New classes:**

- UITesting
- UnitTesting

**New iOS classes:**

- Simulator

**New extensions:**

- Color:

```swift
var redComponent: Int
var greenComponent: Int
var blueComponent: Int
var alpha: CGFloat
```

- String:

```swift
init?(value: Float, maxDigits: Int)
init?(value: Double, maxDigits: Int)
```

- Bundle (now available for the fourth platforms):

```
var appName: String
var appVersion: String
var appBuild: String
var schemes: String
var mainScheme: String
```

**New iOS extensions:**

- UIStoryboard:

```swift
static var main: UIStoryboard
```

- UISwitch:

```swift
func toggle(animated: Bool = true)
```

- UIImage:

```swift
var original: UIImage
var template: UIImage
```

## [0.4.0](https://github.com/tbaranes/SwiftyUtils/releases/tag/0.4.0) (11-09-2016)

#### API breaking changes

- Color extension initializer has been updated:

```swift
convenience init?(hexString: String)
convenience init?(hexString: String, alpha: Float)
```

becomes

```swift
convenience init(hex: String)
convenience init(hex: String, alpha: Float)
```

### Enhancements

*Note: Take a look into the README to see the details of all the following enhancements* 

**New protocols available:**

- Then
- NSBundle is now available for macOS

**New extensions:**

- Color:

```swift
func darker(amount: CGFloat = 0.25) -> SwiftyColor
func lighter(amount: CGFloat = 0.25) -> SwiftyColor
```

- UIImage:

```swift
func filled(with color: UIColor?) -> UIImage
```

## [0.3.0](https://github.com/tbaranes/SwiftyUtils/releases/tag/0.3.0) (19-05-2016)

### API breaking changes

- Creating an UIImage from UIColor is now more swifty: `UIImage(color: .orangeColor())` instead of `UIImage.imageWithTintColor(.orangeColor())`

### Enhancements

*Note: Take a look into the README to see the details of all the following enhancements* 

**New extensions:**

   - NSNotificationCenter:

```swift
func postNotification(name name: String, object: AnyObject? = nil, userInfo: [NSObject : AnyObject]? = nil, queue: dispatch_queue_t)
```

**New iOS extensions:**

   - UIAlertController:
   
```swift
static func show(title title: String, message: String, cancelTitle: String = "OK")
```

   - UIApplication:

```swift
func topViewController() -> UIViewController?
```   

   - UIDevice

```swift
func forceRotation(orientation: UIInterfaceOrientation)
```


## [0.2.0](https://github.com/tbaranes/SwiftyUtils/releases/tag/0.2.0) (09-05-2016)

### Enhancements

*Note: Take a look into the README to see the details of all the following enhancements* 
   
**New extensions:**

   - CollectionType:

```swift
func shuffle()
```

   - MutableCollectionType:

```swift
func shuffleInPlace()
```

   - NSLayoutConstraint:

```swift
func applyMultiplier(multiplier: CGFloat, toView: SwiftyView)
```

   - NSURL:

```swift
func addSkipBackupAttribute()
```

   - NSRange:

```swift
init(rangeOf textToFind: String, in text: String)
```

**New iOS extensions:**

   - UIViewController:
   
```swift
func deletePreviousViewControllers()
func setupBackButton(hidden hidden: Bool = false, title: String = "", backIndicatorImage: UIImage? = nil, tintColor: UIColor? = UIColor.whiteColor())
func setupRightBarView(view: UIView)
func setupLeftBarView(view: UIView)
```

## [0.1.0](https://github.com/tbaranes/SwiftyUtils/releases/tag/0.1.0) (24-04-2016)

First version
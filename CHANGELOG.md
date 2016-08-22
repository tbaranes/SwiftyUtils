# Changelog

All notable changes to the project will be documented in this file.

---

## Next

### API breaking changes

N/A

#### Enhancements

N/A

#### Bugfixes

N/A

## [0.4.0](https://github.com/tbaranes/SwiftyUtils/releases/tag/0.4.0) (11-09-2016)


#### API breaking changes

- Swift 3 support (currently not merged in master, available using branch `feature/swift3`). README is up to date, please report if you find any diffs
- Some APIs have been updated to be more swifty, check out the README for more information

**Extensions removed:**

- UIDevice: 

```
class func deviceModel() -> String
```

- {UI/NS}Color: 

```
convenience init(hex: String, alpha: Float)
```

### Enhancements

*Note: Take a look into the README to see the details of all the following enhancements* 

- watchOS support

**New protocols available:**

- Then
- NSBundle is now available for macOS

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

func darker(amount: CGFloat = 0.25) -> SwiftyColor
func lighter(amount: CGFloat = 0.25) -> SwiftyColor
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
func filled(with color: UIColor?) -> UIImage
```


#### Bugfixes

N/A

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
# Changelog

All notable changes to the project will be documented in this file.

---

## Next

#### Enhancements

N/A

#### Bugfixes

N/A

## [5.5.2](https://github.com/tbaranes/SwiftyUtils/releases/tag/5.5.2) (05-10-2022)

#### Enhancements

- UISliderExtension:

```swift
func value(for gestureRecognizer: UITapGestureRecognizer) -> Float
```

#### Bugfixes

- Xcode 14 support

## [5.5.1](https://github.com/tbaranes/SwiftyUtils/releases/tag/5.5.1) (08-12-2020)

#### Bugfixes

- Fixed builds targeting armv7 using SPM

## [5.5.0](https://github.com/tbaranes/SwiftyUtils/releases/tag/5.5.0) (08-11-2020)

#### Enhancements

- UIViewControllerExtension:

```swift
func addSubSwiftUIView<Content>(_ swiftUIView: Content, to view: UIView) where Content: View
```

- UIViewExtension:

```swift
var parentViewController: UIViewController?
func findView<T>() -> T?
func addSubSwiftUIView<Content>(_ swiftUIView: Content) where Content: View 
func addBorders(to edges: UIRectEdge, borderColor: UIColor, borderWidth: CGFloat)
```

## [5.4.0](https://github.com/tbaranes/SwiftyUtils/releases/tag/5.4.0) (06-10-2020)

Bump min iOS version to 10 when using SPM. This is just to fix a warning from Xcode 12.

## [5.3.0](https://github.com/tbaranes/SwiftyUtils/releases/tag/5.3.0) (02-07-2020)

#### Enhancements

- UIViewControllerExtension:

```swift
var preview: some View
```

- BindingExtension:

```swift
static func mock(_ value: Value) -> Self {
```

- MutableCollection:

```swift
mutating func sort<T: Comparable>(by keyPath: KeyPath<Element, T>, order: (T, T) -> Bool = (<))
```

- SequenceExtension:

```swift
func sorted<T: Comparable>(by keyPath: KeyPath<Element, T>, order: (T, T) -> Bool = (<)) -> [Element]
```

- UITableViewExtension:

```swift
func register<T: UITableViewCell>(cellType: T.Type) where T: Reusable & NibLoadable
func register<T: UITableViewCell>(cellType: T.Type) where T: Reusable
func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath, cellType: T.Type = T.self) -> T where T: Reusable
func register<T: UITableViewHeaderFooterView>(headerFooterViewType: T.Type) where T: Reusable & NibLoadable
func register<T: UITableViewHeaderFooterView>(headerFooterViewType: T.Type) where T: Reusable
func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(_ viewType: T.Type = T.self) -> T? where T: Reusable
```

- UICollectionViewCellExtension:

```swift
func register<T: UICollectionViewCell>(cellType: T.Type) where T: Reusable & NibLoadable
func register<T: UICollectionViewCell>(cellType: T.Type) where T: Reusable T.self) -> T where T: Reusable
func register<T: UICollectionReusableView>(supplementaryViewType: T.Type, ofKind elementKind: String) where T: Reusable & NibLoadable
func register<T: UICollectionReusableView>(supplementaryViewType: T.Type, ofKind elementKind: String) where T: Reusable
func dequeueReusableSupplementaryView<T: UICollectionReusableView>(ofKind elementKind: String, for indexPath: IndexPath, viewType: T.Type = T.self) -> T where T: Reusable
```

- Protocols:

```swift
protocol NibLoadable: AnyObject
protocol NibOwnerLoadable: AnyObject
protocol Reusable: AnyObject
typealias NibReusable = Reusable & NibLoadable
```

## [5.2.0](https://github.com/tbaranes/SwiftyUtils/releases/tag/5.2.0) (28-04-2020)

#### Enhancements

- UIFontExtension:

```swift
class func dynamicStyle(_ style: UIFont.TextStyle, traits: UIFontDescriptor.SymbolicTraits?, sizeCategory: UIContentSizeCategory = .large) -> UIFont
```

- UILabelExtension:

```swift
func configureDynamicStyle(_ style: UIFont.TextStyle, traits: UIFontDescriptor.SymbolicTraits? = nil, minimumScaleFactor: CGFloat = 0.8)
```

- UITextFieldExtension:

```swift
func configureDynamicStyle(_ style: UIFont.TextStyle, traits: UIFontDescriptor.SymbolicTraits? = nil, adjustToFit: Bool = true)
```

- UITextViewExtension:

```swift
func configureDynamicStyle(_ style: UIFont.TextStyle, traits: UIFontDescriptor.SymbolicTraits? = nil)
```

#### Bugfixes

- Fixed missing swift sources added to the targets when using CocoaPods to embed SwiftyUtils

## [5.1.0](https://github.com/tbaranes/SwiftyUtils/releases/tag/5.1.0) (26-04-2020)

#### Enhancements

- Completing missing unit tests
- Adding documentation to the code
- Adding `UIElementPreview`, an easy way to generate mulitple SwiftUI previews with different configuration
- BundleExtension:

```swift
var displayName: String
```

- DictionaryExtension

```swift
func toData(options: JSONSerialization.WritingOptions = []) throws -> Data?
```

- DataExtension:

```swift
func toDictionary(options: JSONSerialization.ReadingOptions = []) throws -> [String: Any]?
```

- NSAttributedStringExtension:

```swift
func isAttributeActivated(_ attribute: NSAttributedString.Key, appliedOn text: String, value: Any) -> Bool
```

- UIApplicationExtension:

```swift
func openAppSettings()
func openAppStoreReviewPage(_ url: URL)
```

- UIButtonExtension:

```swift
func addRightImage(_ image: UIImage?, offset: CGFloat)
```

- UICollectionViewCellExtension:

```swift
func applyCornerRadius(_ radius: CGFloat)
func animate(scale: Bool, duration: TimeInterval = 0.35, transformScale: CGFloat = 0.97, damping: CGFloat = 0.7, options: UIView.AnimationOptions = [], delay: TimeInterval = 0.0, velocity: CGFloat = 0.0, completion: ((Bool) -> Void)? = nil)
```

- UIViewExtension:

```swift
func findView(forIdentifier identifier: String) -> UIView?
func addConstraints(to edges: UIRectEdge = .all, insets: UIEdgeInsets = .zero)
func applyCornerRadius(_ radius: CGFloat, maskedCorners: CACornerMask [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner]) 
```

- UIViewController:

```swift
var isModal: Bool
func addChildController(_ controller: UIViewController, to subview: UIView, animated: Bool = true, duration: TimeInterval = 0.35, options: UIView.AnimationOptions = [.curveEaseInOut, .transitionCrossDissolve])
func addChild(_ child: UIViewController, in containerView: UIView)
func removeChildController(_ child: UIViewController)
func openSafariVC(withURL url: URL, delegate: SFSafariViewControllerDelegate, tintColor: UIColor = .black, barTintColor: UIColor = .white, barCollapsing: Bool = true)
```

- PropertyWrappers:

```swift
@UserDefaultsBacked(key: "defaults_key", defaultValue: 20)
var defaultValue: Int
@UserDefaultsBacked(key: "default_key2")
var defaultKey2: String?
```

## [5.0.1](https://github.com/tbaranes/SwiftyUtils/releases/tag/5.0.1) (12-11-2019)

#### Bugfixes

Fixed SPM compilation

## [5.0.0](https://github.com/tbaranes/SwiftyUtils/releases/tag/5.0.0) (12-11-2019)

#### API breaking changes

- Xcode 11 and Swift 5 support

#### Enhancements

- Moving from Travis to Github Actions
- Updating Swiftlint and fix all related warnings

#### Bugfixes

- Fixed SPM support

## [4.0.0](https://github.com/tbaranes/SwiftyUtils/releases/tag/4.0.0) (27-03-2019)

#### API breaking changes

- Xcode 10.2 and Swift 5 support

#### Enhancements

- Added Data extensions
    - data to hex string
    - hex string to data
    - data to UInt8 array
- Added SystemUtility struct with shell command access
- added ip address validation extension to String

## [3.0.0](https://github.com/tbaranes/SwiftyUtils/releases/tag/3.0.0) (18-09-2018)

#### API breaking changes

- Xcode 10 and Swift 4.2 support
- Removing following methods:
   - `Simulator`
   - `Iteratable`
   - Collection's `random` and `shuffle`
   - Collection's `testAll`, `removeAll`
   - Dictionnary `map` and `flatMap`

#### Bugfixes

- Keep label lineBreakMode when using setLineHeight

## [2.0.0](https://github.com/tbaranes/SwiftyUtils/releases/tag/2.0.0) (04-11-2017)


#### API breaking changes

- Xcode 9 and Swift 4 support
- Removing `String.length`, starting with swift 4, you can directly user  `String.count`

#### Enhancements

- Each `UIButton`'s `UIControlState` will be translated when using `translateSubviews`
- UIApplicationExtension (iOS only)

```swift
public static func delegate<T: UIApplicationDelegate>(_ type: T.Type) -> T? 
```

- NSMutableAttributedString:

```swift
public static func font(inText text: String, font: SwiftyFont, afterOcurrence occurence: String) -> NSMutableAttributedString
public func font(_ font: SwiftyFont, afterOcurrence occurence: String)

public static func font(inText text: String, font: SwiftyFont, occurences searchString: String) -> NSMutableAttributedString
public func font(_ font: SwiftyFont, occurences searchString: String)
```

#### Bugfixes

- Make Array subscript public
- No more duplicate letter when using String's `capitalizedFirst`

## [1.0.0](https://github.com/tbaranes/SwiftyUtils/releases/tag/1.0.0) (17-03-2017)

In order to reach 1.0, SwiftyUtils got a huge cleanup:

- Removing extensions /classes that didn't fit in the library's spirit
- Renaming methods to make them more Swifty
- Introducing dozens of new extensions
- Adding a few missing tests
- Updating the docs
- ...

Since that release contains a lot of changes we won't details them all.

We are really sorry to introduce that many breaking changes, but it was a mandatory cost to release  1.0! Also, the future release should have none (or a very low number) breaking changes and a lot of new features 🎉

A big thanks to [Sweepr777](https://github.com/Sweeper777) for reviewing all the PRs!

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

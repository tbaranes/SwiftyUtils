# Changelog

All notable changes to the project will be documented in this file.

---

### Next

#### API breaking changes

- Creating an UIImage from UIColor is now more swifty: `UIImage(color: .orangeColor())` instead of `UIImage.imageWithTintColor(.orangeColor())`

#### Enhancements

New methods available for the following classes, take a look into the README to see the details:

   
   - NSNotificationCenter:

```swift
func postNotification(name name: String, object: AnyObject? = nil, userInfo: [NSObject : AnyObject]? = nil, queue: dispatch_queue_t)
```

New extensions (iOS) for classes:

   - UIAlertController:
   
```swift
static func show(title title: String, message: String, cancelTitle: String = "OK")
```

   - UIApplication:

```swift
func topMostViewController() -> UIViewController?
```   

   - UIDevice

```swift
func forceRotation(orientation: UIInterfaceOrientation)
```

#### Bugfixes

N/A

## [0.2.0](https://github.com/tbaranes/SwiftyUtils/releases/tag/0.2.0) (05-09-2016)

#### Enhancements

New methods available for the following classes, take a look into the README to see the details:

   
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

New extensions (iOS) for classes:

   - UIViewController:
   
```swift
func deletePreviousViewControllers()
func setupBackButton(hidden hidden: Bool = false, title: String = "", backIndicatorImage: UIImage? = nil, tintColor: UIColor? = UIColor.whiteColor())
func setupRightBarView(view: UIView)
func setupLeftBarView(view: UIView)
```

## [0.1.0](https://github.com/tbaranes/SwiftyUtils/releases/tag/0.1.0) (24-04-2016)

First version
# Changelog

All notable changes to the project will be documented in this file.

---

### Next

#### API breaking changes

N/A
 
#### Enhancements

New methods available for the following classes, take a look into the README to see the details:

   
   - CollectionType:

```swift
swiftshuffle()
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

#### Bugfixes

N/A

## [0.1.0](https://github.com/tbaranes/SwiftyUtils/releases/tag/0.1.0) (2016-04-24)

First version
# Changelog

All notable changes to the project will be documented in this file.

---

### Next

#### API breaking changes

N/A
 
#### Enhancements

- New extensions (iOS, OSX, tvOS) for classes:
   
    - CollectionType:

```swift
swiftshuffle()
```

   - MutableCollectionType:

```swift
func shuffleInPlace()
```

   - NSLayoutConstraint

```swift
func applyMultiplier(multiplier: CGFloat, toView: SwiftyView)
```

- New extensions (iOS) for classes:

    - UIViewController:
   
```swift
func deletePreviousViewControllers()
func setupBackButton(hidden: Bool = false, title: String = "", backIndicatorImage: UIImage? = nil, tintColor: UIColor?)
func setupRightBarView(view: UIView)
func setupLeftBarView(view: UIView)
```

- New methods for `NSURL` extension:
    -  `addSkipBackupAttribute()`

Check out the README to see the methods of these extensions.

#### Bugfixes

N/A

## [0.1.0](https://github.com/tbaranes/SwiftyUtils/releases/tag/0.1.0) (2016-04-24)

First version
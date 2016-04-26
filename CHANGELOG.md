# Changelog

All notable changes to the project will be documented in this file.

---

### Next

#### API breaking changes

N/A
 
#### Enhancements

- New extensions (iOS, OSX, tvOS) for classes:
    - `CollectionType`:
        - `shuffle()`
    - `MutableCollectionType`:
        - `shuffleInPlace()`
    - `NSLayoutConstraint`
        - `applyMultiplier(multiplier: CGFloat, toView: SwiftyView)`

- New extensions (iOS) for classes:
    - `UIViewController`:
        - `deletePreviousViewControllers()`

- New methods for `NSURL` extension:
    -  `addSkipBackupAttribute()`

Check out the README to see the methods of these extensions.

#### Bugfixes

N/A

## [0.1.0](https://github.com/tbaranes/SwiftyUtils/releases/tag/0.1.0) (2016-04-24)

First version
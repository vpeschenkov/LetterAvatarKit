# CHANGELOG

```
#### Added for new features.
#### Changed for changes in existing functionality.
#### Deprecated for once-stable features removed in upcoming releases.
#### Removed for deprecated features removed in this release.
#### Fixed for any bug fixes.
```

### Unreleased
#### Added
- Added optional explicit avatar text via `LetterAvatarBuilderConfiguration.letters` and `LetterAvatarMaker.setLetters(_:)`.
- Added Swiftier `makeAvatar(_:)` and `UIImage.makeLetterAvatar(...)` overloads while keeping existing APIs.

#### Fixed
- Updated the podspec to declare multiple frameworks with `frameworks`.

### 2.0.0
#### Changed
- Raised minimum deployment targets to iOS 12.0 and tvOS 12.0.
- Updated the package, podspec, and project settings for Swift 5.9.
- Modernized image rendering to use `UIGraphicsImageRenderer`.
- Updated the Swift example to depend on the local package checkout.
- Replaced Travis CI with GitHub Actions.

#### Removed
- Removed obsolete compatibility helpers and tests for standard library APIs.
- Removed Carthage documentation.

### 1.2.5
#### Removed
- Removed `SwiftUI` dependency (#31)

### 1.2.4
#### Added
- Xcode 12 support

### 1.2.1
#### Added
- An ability to add borders
- An ability to make the generated image circle

### 1.2.0
#### Added
- Builder pattern

#### Changed
- `LAK` prefix renamed to `LK`

### 1.1.9
#### Added
- Xcode 11 support

# LetterAvatarKit

[![Swift 5.9](https://img.shields.io/badge/Swift-5.9-orange.svg)](https://swift.org)
[![Platforms](https://img.shields.io/badge/platform-iOS%2012%2B%20%7C%20tvOS%2012%2B-lightgrey.svg)](https://developer.apple.com)
[![SPM](https://img.shields.io/badge/Swift_Package_Manager-compatible-brightgreen.svg)](https://swift.org/package-manager)
[![CocoaPods](https://img.shields.io/cocoapods/v/LetterAvatarKit.svg)](https://cocoapods.org/pods/LetterAvatarKit)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

Generate beautiful, deterministic letter avatars for iOS and tvOS with a tiny UIKit-first Swift library.

`LetterAvatarKit` turns names, usernames, initials, emails, and placeholders into polished `UIImage` avatars. It is ideal for chat apps, contact lists, teams, CRM products, profile fallbacks, onboarding flows, and any UI that needs fast identity visuals without downloading remote images.

![LetterAvatarKit examples][Screenshots]

## Why LetterAvatarKit

- Zero network dependency: create avatars locally from a string.
- Deterministic colors: the same name can produce a consistent visual identity.
- UIKit native: returns `UIImage` and works with `UIImageView` immediately.
- Flexible styling: size, initials, font, text color, background palette, borders, circle or square shape.
- Swift-first API: builder API, configuration object, and `UIImage` extension.
- Lightweight install: Swift Package Manager or CocoaPods.
- Production-ready targets: iOS 12+, tvOS 12+, Swift 5.9+.

## Installation

### Swift Package Manager

In Xcode, add this repository as a package dependency:

```text
https://github.com/vpeschenkov/LetterAvatarKit
```

### CocoaPods

Add `LetterAvatarKit` to your `Podfile`:

```ruby
pod "LetterAvatarKit"
```

## Quick Start

### Swift

```swift
import LetterAvatarKit

avatarImageView.image = UIImage.makeLetterAvatar(withUsername: "Taylor Swift")
```

For a customized avatar:

```swift
let avatar = LetterAvatarMaker()
    .setUsername("Taylor Swift")
    .setSize(CGSize(width: 96, height: 96))
    .setCircle(true)
    .setBorderWidth(2)
    .setBorderColor(.white)
    .setBackgroundColors([.systemPurple, .systemIndigo, .systemPink])
    .build()

avatarImageView.image = avatar
```

Using the closure-based builder:

```swift
let avatar = LetterAvatarMaker().build { configuration in
    configuration.username = "Design Team"
    configuration.size = CGSize(width: 80, height: 80)
    configuration.circle = true
    configuration.useSingleLetter = false
    configuration.lettersFont = .boldSystemFont(ofSize: 28)
    configuration.backgroundColors = [.systemBlue]
}
```

Using a configuration object directly:

```swift
let configuration = LetterAvatarBuilderConfiguration()
configuration.username = "Letter Avatar"
configuration.circle = true
configuration.borderWidth = 1

avatarImageView.image = UIImage.makeLetterAvatar(withConfiguration: configuration)
```

## Configuration

`LetterAvatarBuilderConfiguration` supports the common controls needed for modern avatar UI:

| Property | Description |
| --- | --- |
| `username` | Source string used to extract initials and pick the background color. |
| `size` | Output image size. Defaults to `80x80`. |
| `useSingleLetter` | Uses one initial instead of up to three letters. |
| `lettersFont` | Custom font for the initials. |
| `lettersColor` | Text color for the initials. |
| `backgroundColors` | Palette used for avatar backgrounds. |
| `lettersFontAttributes` | Advanced text attributes for custom rendering. |
| `circle` | Generates a circular avatar when `true`; square when `false`. |
| `borderWidth` | Border width around the avatar. |
| `borderColor` | Border color around the avatar. |
| `isOpaque` | Draws an opaque background when enabled. |

## Use Cases

- Profile placeholders before a user uploads a photo.
- Chat and messaging participant avatars.
- Contact, customer, and team member lists.
- Offline-first apps that need instant avatar rendering.
- Design systems that need consistent identity fallback images.

## Requirements

- iOS 12+
- tvOS 12+
- Swift 5.9+
- Xcode 15+

## Keywords

`swift`, `ios`, `tvos`, `uikit`, `avatar`, `initials`, `profile-image`, `placeholder`, `contacts`, `chat-ui`, `swift-package-manager`, `cocoapods`

## Contributing

Issues, ideas, and pull requests are welcome. Please read [CONTRIBUTING.md](CONTRIBUTING.md) and follow the [Code of Conduct](CODE_OF_CONDUCT.md).

## License

LetterAvatarKit is released under the MIT license. See [LICENSE](LICENSE) for details.

[Screenshots]: https://i.imgur.com/n3SjH6q.jpg

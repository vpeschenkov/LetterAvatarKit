# LetterAvatarKit

![][Swift Version] ![][Pods] ![][Platform] ![][Carthage compatible] ![][Codacy Badge]
![][Travis]

`LetterAvatarKit` provides an ```UIImage``` extension for generating letter-based avatars/placeholders. There are a few images showing what you can achive by using this framework:

![][screenshots]

## Requirements
- iOS 8+
- tvOS 9+
- Swift 4.0+

## Features
- Ease of use
- Flexible API
- Builder pattern
- Circle/Square/Bordered image
- Flat UI colors
- tvOS support

## Installation

### [CocoaPods](https://cocoapods.org)

`LetterAvatarKit` is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:
```ruby
pod "LetterAvatarKit", "1.2.5" # Swift 5.0+, Xcode 12
pod "LetterAvatarKit", "1.2.3" # Swift 5.0+, Xcode 11
pod "LetterAvatarKit", "1.1.7" # Swift 4.2
pod "LetterAvatarKit", "1.1.5" # Swift 4.0
```

### [Carthage](https://github.com/Carthage/Carthage)

Add this to `Cartfile`

```ruby
github "vpeschenkov/LetterAvatarKit" == 1.2.5 # Swift 5.0+, Xcode 12
github "vpeschenkov/LetterAvatarKit" == 1.2.3 # Swift 5.0+, Xcode 11
github "vpeschenkov/LetterAvatarKit" == 1.1.7 # Swift 4.2
github "vpeschenkov/LetterAvatarKit" == 1.1.5 # Swift 4.0
```

```sh
$ carthage update
```

## Usage

### Swift

Using `LetterAvatarMaker`:

```swift
// Square avatar image
let avatarImage = LetterAvatarMaker()
    .setUsername("Letter Avatar")
    .build()
avatarImageView.image = avatarImage

// Circle avatar image with white border
let circleAvatarImage = LetterAvatarMaker()
    .setCircle(true)
    .setUsername("Letter Avatar")
    .setBorderWidth(1.0)
    .setBackgroundColors([ .red ])
    .build()
avatarImageView.image = circleAvatarImage
```

Using `LetterAvatarMaker` with closures:

```swift
let avatarImage = LetterAvatarMaker()
    .build { c in
        c.username = "Letter Avatar"
    }
avatarImageView.image = avatarImage

let avatarImage = LetterAvatarMaker()
    .build { c in
        c.circle = true
        c.username = "Letter Avatar"
        c.borderWidth = 1.0
        c.backgroundColors = [ .red ]
    }
avatarImageView.image = avatarImage
```

Using `LetterAvatarBuilderConfiguration`:
```swift
let configuration = LetterAvatarBuilderConfiguration()
configuration.username = "Letter Avatar"
avatarImageView.image = UIImage.makeLetterAvatar(withConfiguration: configuration)
```

Using UIImage extension:
```swift
avatarImageView.image = UIImage.makeLetterAvatar(withUsername: "Letter Avatar")
```

### Objective-C

Using `LKLetterAvatarBuilderCongiguration`:
```objc
LKLetterAvatarBuilderCongiguration *configuration = [[LKLetterAvatarBuilderCongiguration alloc] init];
configuration.username = @"Letter Avatar";
self.avatarImageView.image = [UIImage lk_makeLetterAvatarWithConfiguration:configuration];
```
Using UIImage extension:
```objc
self.avatarImageView.image = [UIImage lk_makeLetterAvatarWithUsername:@"Letter Avatar"];
```

## Customization

You can configure the following properties of `LetterAvatarBuilderConfiguration`:

```swift
/// The username.
open var username: String?
```

```swift
/// The size of an avatar image.
open var size: CGSize = CGSize(width: 80, height: 80)
```

```swift
/// The flag that indicates of using single only one letter, otherwise,
/// as much as wil be possible to obtain. But no more than 3 letters.
open var isSingleLettered: Bool = false
```

```swift
/// The letters font.
open var lettersFont: UIFont = UIFont.systemFont(ofSize: 16.0)
```

```swift
/// The letters colors
open var lettersColor: UIColor = LKUIColorByRGB(red: 236, green: 240, blue: 241)
```

```swift
/// The background colors of an image.
open var backgroundColors: [UIColor] = UIColor.colors
```

```swift
/// The letters font attributes.
open var lettersFontAttributes: [NSAttributedString.Key: Any]?
```

```swift
/// Indicates whether to generate circle or square image.
open var circle: Bool = false
```

```swift
/// The border width of the image.
open var borderWidth: CGFloat = 0.0
```

```swift
/// The border color of the image.
open var borderColor: UIColor = UIColor.white
```

```swift
/// A Boolean flag indicating whether the avatar is opaque.
open var opaque: Bool = false
```

## Community

Questions, comments, issues, and pull requests are welcome!

## Contacts

- [GitHub](https://github.com/vpeschenkov)
- [Twitter](https://twitter.com/vpeschenkov)

## License

Distributed under the MIT license. See [LICENSE](https://github.com/vpeschenkov/LetterAvatarKit/blob/master/LICENSE) for more information.

[Screenshots]: https://i.imgur.com/n3SjH6q.jpg
[Platform]: https://cocoapod-badges.herokuapp.com/p/LetterAvatarKit/badge.png
[Travis]: https://travis-ci.org/vpeschenkov/LetterAvatarKit.svg?branch=master
[Pods]: https://cocoapod-badges.herokuapp.com/v/LetterAvatarKit/badge.png
[Swift Version]: https://img.shields.io/badge/swift-5.0-orange.svg?style=flat
[Codacy Badge]: https://api.codacy.com/project/badge/Grade/d0f9b1a4ccb64d4aacd18a971e4cf8b7
[Carthage compatible]: https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat(https://github.com/Carthage/Carthage)

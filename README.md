# LetterAvatarKit

![][Platform] ![][Travis] ![][Pods] ![][Carthage compatible] ![][Swift Version] ![][Codacy Badge]

`LetterAvatarKit` provides an ```UIImage``` extension for generating letter-based avatars. There are a few images showing what you can achive by using this framework:

![][screenshots]

## Requirements
- iOS 8 and later
- Swift 4.0 and later

## Installation

### [CocoaPods](https://cocoapods.org)

`LetterAvatarKit` is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:
```ruby
pod "LetterAvatarKit", "1.1.9" # Swift 5.0
pod "LetterAvatarKit", "1.1.7" # Swift 4.2
pod "LetterAvatarKit", "1.1.5" # Swift 4.0
```

### [Carthage](https://github.com/Carthage/Carthage)

Add this to `Cartfile`

```ruby
github "vpeschenkov/LetterAvatarKit" == 1.1.9 # Swift 5.0
github "vpeschenkov/LetterAvatarKit" == 1.1.7 # Swift 4.2
github "vpeschenkov/LetterAvatarKit" == 1.1.5 # Swift 4.0
```

```sh
$ carthage update
```

## Usage

### Swift

By `LetterAvatarBuilderConfiguration`:
```swift
let configuration = LetterAvatarBuilderConfiguration()
configuration.username = "Letter Avatar"
avatarImageView?.image = UIImage.makeLetterAvatar(withConfiguration: configuration)
```
or simplier without the one:
```swift
avatarImageView?.image = UIImage.makeLetterAvatar(withUsername: "Letter Avatar")
```

### Objective-C

Using a configuration:
```objc
LAKLetterAvatarBuilderCongiguration *configuration = [[LAKLetterAvatarBuilderCongiguration alloc] init];
configuration.username = @"Letter Avatar";
self.avatarImageView.image = [UIImage lak_makeLetterAvatarWithConfiguration:configuration];
```
or simplier without the one:
```objc
self.avatarImageView.image = [UIImage lak_makeLetterAvatarWithUsername:@"Letter Avatar"];
```

## Customization

You can configure the following properties of `LetterAvatarBuilderConfiguration`:

```swift
/// The size of an avatar image.
open var size: CGSize = CGSize(width: 80, height: 80)
```

```swift
/// The username.
open var username: String?
```

```swift
/// The flag that indicates of using single letter instead of two lettters.
open var singleLetter: Bool = false
```

```swift
/// The letters font.
open var lettersFont: UIFont = UIFont.systemFont(ofSize: 16.0)
```

```swift
/// The letters colors
open var lettersColor: UIColor = LAKUIColorByRGB(red: 236, green: 240, blue: 241)
```

```swift
/// The background colors of an image.
open var backgroundColors: [UIColor] = UIColor.colors
```

```swift
/// The letters font attributes.
open var lettersFontAttributes: [NSAttributedString.Key: Any]?
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

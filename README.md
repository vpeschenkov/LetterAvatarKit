# LetterAvatarKit

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/d0f9b1a4ccb64d4aacd18a971e4cf8b7)](https://www.codacy.com/app/nerevarxx/LetterAvatarKit?utm_source=github.com&utm_medium=referral&utm_content=vpeschenkov/LetterAvatarKit&utm_campaign=badger)

![][Platform] ![][Travis] ![][Pods] ![][Swift3.2] ![][Swift4.0]

LetterAvatarKit is an ```UIImage``` extension that generates letter-based avatars written in Swift. Here are some images showing what the LetterAvatarKit does:

![][screenshots]

## Requirements
- iOS 8 and later
- Swift 3.2 and later

## Installation

To use with **Swift 3.2** please ensure you are using **v1.1.1**

To use with **Swift 4.0** please ensure you are using **v1.1.2**

### CocoaPods

To install LetterAvatarKit using CocoaPods, add this line to your Podfile:
```
pod "LetterAvatarKit"
```

## Usage

You can configure the following properties of LetterAvatarBuilderConfiguration:

```
/// The size of an avatar image.
open var size: CGSize = CGSize(width: 80, height: 80)
```

```
/// The username.
open var username: String?
```

```
/// The flag that indicates of using single letter instead of two lettters.
open var singleLetter: Bool = false
```

```
/// The letters font.
open var lettersFont: UIFont = UIFont.systemFont(ofSize: 16.0)
```

```
/// The letters colors
open var lettersColor: UIColor = LAKUIColorByRGB(red: 236, green: 240, blue: 241)
```

```
/// The background colors of an image.
open var backgroundColors: [UIColor] = UIColor.colors
```

### Swift

Using a configuration:
```
let configuration = LetterAvatarBuilderConfiguration()
configuration.username = "Letter Avatar"
avatarImageView?.image = UIImage.makeLetterAvatar(withConfiguration: configuration)
```
or
```
avatarImageView?.image = UIImage.makeLetterAvatar(withUsername: "Letter Avatar")
```

### Objective-C

Using a configuration:
```
LAKLetterAvatarBuilderCongiguration *configuration = [[LAKLetterAvatarBuilderCongiguration alloc] init];
configuration.username = @"Letter Avatar";
self.avatarImageView.image = [UIImage lak_makeLetterAvatarWithConfiguration:configuration];
```
or
```
self.avatarImageView.image = [UIImage lak_makeLetterAvatarWithUsername:@"Letter Avatar"];
```

## Community

Questions, comments, issues, and pull requests are always welcome!

## Thanks

Thanks [Cargo](https://github.com/Gargo) for translating [README](https://github.com/vpeschenkov/LetterAvatarKit/blob/master/README.md) into [Russian](http://gargo.of.by/letteravatarkit/).

## License

Distributed under the MIT license. See LICENSE for more information.

[Screenshots]: https://i.imgur.com/n3SjH6q.jpg
[Platform]: https://cocoapod-badges.herokuapp.com/p/LetterAvatarKit/badge.png
[Travis]: https://travis-ci.org/vpeschenkov/LetterAvatarKit.svg?branch=master
[Pods]: https://cocoapod-badges.herokuapp.com/v/LetterAvatarKit/badge.png
[Swift3.2]: https://img.shields.io/badge/swift-3.2-orange.svg?style=flat
[Swift4.0]: https://img.shields.io/badge/swift-4.0-orange.svg?style=flat


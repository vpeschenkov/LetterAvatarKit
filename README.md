# LetterAvatarKit

![][Travis] ![][Pods] ![][Platform]

LetterAvatarKit is an ```UIImage``` extension that generates letter-based avatars written in Swift. Here are some images showing what the LetterAvatarKit does:

![][screenshots]

## Requirements
- iOS 9 and later
- Swift 3.2 and later

## Install

### CocoaPods

To install LetterAvatarKit using CocoaPods, add this line to your Podfile:
```
pod "LetterAvatarKit"
```

## Usage

You can configure the following properties of LetterAvatarBuilderConfiguration:

- ```size``` - the result image size (default is 80x80)
- ```username``` - the username (if  the username is ```nil```, uses "NA")
- ```letterFont``` - the letter font (default is ```UIFont.systemFont(ofSize: 16.0)```)
- ```letterColor``` - the letter color (default is ```rgb(236, 240, 241)```)
- ```backgroundColors``` - an array of background colors (default using the colors from [flatuicolors.com](http://flatuicolors.com/))

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

Thanks [Cargo](https://github.com/Gargo) for translating [README](https://github.com/vpeschenkov/LetterAvatarKit/blob/master/README.md) to [Russian](http://gargo.of.by/letteravatarkit/).

## License

Distributed under the MIT license. See LICENSE for more information.

[Screenshots]: https://i.imgur.com/n3SjH6q.jpg

[Travis]: https://travis-ci.org/vpeschenkov/LetterAvatarKit.svg?branch=master
[Pods]: https://cocoapod-badges.herokuapp.com/v/LetterAvatarKit/badge.png
[Platform]: https://cocoapod-badges.herokuapp.com/p/LetterAvatarKit/badge.png

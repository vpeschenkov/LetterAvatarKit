# LetterAvatarKit

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
- ```backgroundColors``` - an array of background colors (default using the colors from flatuicolors.com)

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

## License

Distributed under the MIT license. See LICENSE for more information.

[screenshots]: https://i.imgur.com/n3SjH6q.jpg

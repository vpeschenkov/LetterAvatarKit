//
// LetterAvatarBuilderConfiguration.swift
// LetterAvatarKit
//
// Copyright 2017 Victor Peschenkov
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// o this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//

import UIKit
import Foundation

/// Uses for configurating a LetterAvatarBuilder instance.
@objc(LKLetterAvatarBuilderConfiguration)
open class LetterAvatarBuilderConfiguration: NSObject {
    /// A size of an avatar image.
    @objc(size)
    open var size: CGSize = CGSize(width: 80, height: 80)
    /// An username.
    @objc(username)
    open var username: String?
    /// A flag that indicates of using single only one letter, otherwise,
    /// as much as wil be possible to obtain. But no more than 3 letters.
    @objc(useSingleLetter)
    open var useSingleLetter: Bool = false
    /// Letters font.
    @objc(lettersFont)
    open var lettersFont: UIFont?
    /// Colors that are used to draw image.
    @objc(lettersColor)
    open var lettersColor: UIColor = LKUIColorByRGB(red: 236, green: 240, blue: 241)
    /// Background colors of the image.
    @objc(backgroundColors)
    open var backgroundColors: [UIColor] = UIColor.colors
    /// Letters font attributes.
    @objc(lettersFontAttributes)
    open var lettersFontAttributes: [NSAttributedString.Key: Any]?
    /// Indicates whether to generate circle or square image.
    @objc(circle)
    open var circle: Bool = false
    /// A border width of the image.
    @objc(borderWidth)
    open var borderWidth: CGFloat = 0.0
    /// A border color of the image.
    @objc(borderColor)
    open var borderColor: UIColor = UIColor.white
    /// A Boolean flag indicating whether the avatar is opaque.
    @objc(isOpaque)
    open var isOpaque: Bool = false
}

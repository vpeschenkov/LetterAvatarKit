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

import Foundation

/// Uses for configurating a LetterAvatarBuilder instance.
@objc(LAKLetterAvatarBuilderConfiguration)
open class LetterAvatarBuilderConfiguration: NSObject {
    /// The size of an avatar image.
    @objc(size)
    open var size: CGSize = CGSize(width: 80, height: 80)
    /// The username.
    @objc(username)
    open var username: String?
    /// The flag that indicates of using single letter instead of two lettters.
    @objc(singleLetter)
    open var singleLetter: Bool = false
    /// The letters font.
    @objc(lettersFont)
    open var lettersFont: UIFont = UIFont.systemFont(ofSize: 16.0)
    /// The letters colors.
    @objc(lettersColor)
    open var lettersColor: UIColor = LAKUIColorByRGB(red: 236, green: 240, blue: 241)
    /// The background colors of a letter-based avatar.
    @objc(backgroundColors)
    open var backgroundColors: [UIColor] = UIColor.colors
}

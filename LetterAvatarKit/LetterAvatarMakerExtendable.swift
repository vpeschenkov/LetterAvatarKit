//
//  LetterAvatarMakerExtendable.swift
//  LetterAvatarKit
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

public protocol LetterAvatarMakerExtendable: NSObjectProtocol {
    /// Sets the image size which is used to draw the image.
    func setSize(_ size: CGSize) -> LetterAvatarMakerExtendable
    /// Sets a username size which is used to draw the image.
    func setUsername(_ username: String) -> LetterAvatarMakerExtendable
    /// Sets the letter font which is used to draw the letters.
    func setLettersFont(_ lettersFont: UIFont?) -> LetterAvatarMakerExtendable
    /// Sets the letter color which is used to draw the letters.
    func setLettersColor(_ lettersColor: UIColor) -> LetterAvatarMakerExtendable
    /// Sets whether to generate single-lettered image or not.
    func setSingleLettered(_ isSingleLettered: Bool) -> LetterAvatarMakerExtendable
    /// Sets the letter background colors which are used to draw the letters.
    func setBackgroundColors(_ backgroundColors: [UIColor]) -> LetterAvatarMakerExtendable
    /// Sets the letter font attributes which are used to draw the letters.
    func setLettersFontAttributes(
        _ lettersFontAttributes: [NSAttributedString.Key: Any]?
    ) -> LetterAvatarMakerExtendable
    // Sets whether to generate circle or square image.
    func setCircle(_ isCircle: Bool) -> LetterAvatarMakerExtendable
    /// Sets the image border width which is used to draw the image.
    func setBorderWidth(_ borderWidth: CGFloat) -> LetterAvatarMakerExtendable
    /// Sets the image border color which is used to draw the image.
    func setBorderColor(_ borderColor: UIColor) -> LetterAvatarMakerExtendable
    /// Builds the image using the `maker` values
    func build(maker: (LetterAvatarBuilderConfiguration) -> Void) -> UIImage?
    /// Builds the image using self parameters
    func build() -> UIImage?
}

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

import UIKit
import Foundation

public protocol LetterAvatarMakerExtendable: NSObjectProtocol {
    func setSize(_ size: CGSize) -> LetterAvatarMakerExtendable
    func setUsername(_ username: String) -> LetterAvatarMakerExtendable
    func setLettersFont(_ lettersFont: UIFont?) -> LetterAvatarMakerExtendable
    func setLettersColor(_ lettersColor: UIColor) -> LetterAvatarMakerExtendable
    func useSingleLetter(_ useSingleLetter: Bool) -> LetterAvatarMakerExtendable
    func setBackgroundColors(_ backgroundColors: [UIColor]) -> LetterAvatarMakerExtendable
    func setLettersFontAttributes(
        _ lettersFontAttributes: [NSAttributedString.Key: Any]?
    ) -> LetterAvatarMakerExtendable
    func setCircle(_ circle: Bool) -> LetterAvatarMakerExtendable
    func setBorderWidth(_ borderWidth: CGFloat) -> LetterAvatarMakerExtendable
    func setBorderColor(_ borderColor: UIColor) -> LetterAvatarMakerExtendable
    func drawOpaqueBackground(_ isOpaque: Bool) -> LetterAvatarMakerExtendable
    func build(maker: (LetterAvatarBuilderConfiguration) -> Void) -> UIImage?
    func build() -> UIImage?
}

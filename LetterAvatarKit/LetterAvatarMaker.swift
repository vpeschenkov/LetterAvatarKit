//
//  LetterAvatarMaker.swift
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

open class LetterAvatarMaker: NSObject {
    fileprivate var configuration = LetterAvatarBuilderConfiguration()
}

extension LetterAvatarMaker: LetterAvatarMakerExtendable {
    @discardableResult
    public func setSize(_ size: CGSize) -> LetterAvatarMakerExtendable {
        configuration.size = size
        return self
    }
    
    @discardableResult
    public func setUsername(_ username: String) -> LetterAvatarMakerExtendable {
        configuration.username = username
        return self
    }
    
    @discardableResult
    public func setLettersFont(_ lettersFont: UIFont?) -> LetterAvatarMakerExtendable {
        configuration.lettersFont = lettersFont
        return self
    }
    
    @discardableResult
    public func setLettersColor(_ lettersColor: UIColor) -> LetterAvatarMakerExtendable {
        configuration.lettersColor = lettersColor
        return self
    }
    
    @discardableResult
    public func useSingleLetter(_ useSingleLetter: Bool) -> LetterAvatarMakerExtendable {
        configuration.useSingleLetter = useSingleLetter
        return self
    }
    
    @discardableResult
    public func setBackgroundColors(_ backgroundColors: [UIColor]) -> LetterAvatarMakerExtendable {
        configuration.backgroundColors = backgroundColors
        return self
    }
    
    @discardableResult
    public func setLettersFontAttributes(
        _ lettersFontAttributes: [NSAttributedString.Key: Any]?
    ) -> LetterAvatarMakerExtendable {
        configuration.lettersFontAttributes = lettersFontAttributes
        return self
    }
    
    @discardableResult
    public func setBorderWidth(_ borderWidth: CGFloat) -> LetterAvatarMakerExtendable {
        configuration.borderWidth = borderWidth
        return self
    }
    
    @discardableResult
    public func setBorderColor(_ borderColor: UIColor) -> LetterAvatarMakerExtendable {
        configuration.borderColor = borderColor
        return self
    }
    
    @discardableResult
    public func setCircle(_ circle: Bool) -> LetterAvatarMakerExtendable {
        configuration.circle = circle
        return self
    }
    
    @discardableResult
    public func drawOpaqueBackground(_ isOpaque: Bool) -> LetterAvatarMakerExtendable {
        configuration.isOpaque = isOpaque
        return self
    }
    
    public func build(maker: (LetterAvatarBuilderConfiguration) -> Void) -> UIImage? {
        maker(configuration)
        return UIImage.makeLetterAvatar(withConfiguration: configuration)
    }
    
    public func build() -> UIImage? {
        return UIImage.makeLetterAvatar(withConfiguration: configuration)
    }
}

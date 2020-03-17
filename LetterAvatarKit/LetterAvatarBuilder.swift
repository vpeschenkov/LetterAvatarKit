//
// LetterAvatarKit.swift
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

/// Uses for making letter-based avatar images.
@objc(LKLetterAvatarBuilder)
open class LetterAvatarBuilder: NSObject {
    /// Makes a letter-based avatar image by using a given configuration.
    ///
    /// - Parameters:
    ///     - configuration: A configuration that is used to draw a
    /// letter-based avatar image.
    ///
    /// - Returns: Returns whether an instance of UIImage or nil.
    @objc(makeAvatarWithConfiguration:)
    open func makeAvatar(with configuration: LetterAvatarBuilderConfiguration) -> UIImage? {
        let colors = configuration.backgroundColors
        guard let username = configuration.username else {
            return drawAvatar(
                with: configuration,
                letters: NSLocalizedString("NA", comment: ""),
                backgroundColor: colors[0].cgColor
            )
        }
        let usernameInfo = UsernameInfo(
            username: username,
            singleLetter: configuration.useSingleLetter
        )
        var colorIndex = 0
        if colors.count > 1 {
            colorIndex = usernameInfo.ASCIIValue
            colorIndex *= 3557 // Prime number
            colorIndex %= colors.count - 1
        }
        let backgroundColor = colors[colorIndex].cgColor
        return drawAvatar(
            with: configuration,
            letters: usernameInfo.letters,
            backgroundColor: backgroundColor
        )
    }
    
    private func drawAvatar(
        with configuration: LetterAvatarBuilderConfiguration,
        letters: String,
        backgroundColor: CGColor
        ) -> UIImage? {
        let rect = CGRect(x: 0.0, y: 0.0, width: configuration.size.width, height: configuration.size.height)
        UIGraphicsBeginImageContextWithOptions(rect.size, configuration.isOpaque, UIScreen.main.scale)
        if let context = UIGraphicsGetCurrentContext() {
            let borderWidth = configuration.borderWidth
            let borderColor = configuration.borderColor.cgColor
            let strokeRect = rect.insetBy(dx: borderWidth * 0.5, dy: borderWidth * 0.5)
            context.setFillColor(backgroundColor)
            context.setStrokeColor(borderColor)
            context.setLineWidth(borderWidth)
            if configuration.circle {
                context.fillEllipse(in: rect)
                context.strokeEllipse(in: strokeRect)
            } else {
                context.fill(rect)
                context.stroke(strokeRect)
            }
            
            var attributes = configuration.lettersFontAttributes
            if attributes == nil {
                attributes = [
                    .paragraphStyle: NSParagraphStyle.default.mutableCopy(),
                    .font: makeFitFont(withFont: configuration.lettersFont, forSize: rect.size),
                    .foregroundColor: configuration.lettersColor
                ]
            }

            let lettersSize = letters.size(withAttributes: attributes)
            let lettersRect = CGRect(
                x: (rect.size.width - lettersSize.width) / 2.0,
                y: (rect.size.height - lettersSize.height) / 2.0,
                width: lettersSize.width,
                height: lettersSize.height
            )
            letters.draw(in: lettersRect, withAttributes: attributes)
            let avatarImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return avatarImage
        }
        return nil
    }
    
    private func makeFitFont(withFont font: UIFont?, forSize size: CGSize) -> UIFont {
        guard let font = font else {
            return UIFont.systemFont(ofSize: min(size.height, size.width) / 2.0)
        }
        let fitFont = font.withSize(min(size.height, size.width) / 2.0)
        return fitFont.pointSize < font.pointSize ? fitFont : font
    }
}

private class UsernameInfo {
    
    public var letters: String {
        return userInfo.letters
    }
    
    public var ASCIIValue: Int {
        return userInfo.value
    }
    
    private let username: String
    private let useSingleLetter: Bool
    
    private typealias InfoContainer = (letters: String, value: Int)
    private lazy var userInfo: InfoContainer = {
        var letters = String()
        var lettersASCIIValue = 0
        // Obtains an array of words by using a given username
        let components = username.components(separatedBy: " ")
        // If there are whether two words or more
        if components.count > 1 {
            if !useSingleLetter {
                for component in components.prefix(3) {
                    if let letter = component.first {
                        letters.append(letter)
                        lettersASCIIValue += letter.ASCIIValue
                    }
                }
            } else {
                if let firstComponent = components.first {
                    // Process the firs name letter
                    if let letter = firstComponent.first {
                        letters.append(letter)
                        lettersASCIIValue += letter.ASCIIValue
                    }
                }
            }
        } else {
            // If given just one word
            if let component = components.first {
                // Process the firs name letter
                if let letter = component.first {
                    letters.append(letter)
                    lettersASCIIValue += letter.ASCIIValue
                    // If single Letter is passed as false but the string is a single char,
                    // this line fails due to out of bounds exception.
                    // https://github.com/vpeschenkov/LetterAvatarKit/issues/11
                    if !useSingleLetter && component.count >= 2 {
                        // Process the second name letter
                        let startIndex = component.index(after: component.startIndex)
                        let endIndex = component.index(component.startIndex, offsetBy: 2)
                        let substring = component[startIndex..<endIndex].capitalized
                        if let letter = substring.first {
                            letters.append(letter)
                            lettersASCIIValue += letter.ASCIIValue
                        }
                    }
                }
            }
        }
        return (letters: letters, value: lettersASCIIValue)
    }()
    
    init(username: String, singleLetter: Bool) {
        self.username = username
        self.useSingleLetter = singleLetter
    }
}

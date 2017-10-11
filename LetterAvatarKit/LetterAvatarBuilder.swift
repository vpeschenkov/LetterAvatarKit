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
import Foundation

@objc(LAKLetterAvatarBuilderCongiguration)
open class LetterAvatarBuilderConfiguration: NSObject {
    public var size: CGSize = CGSize(width: 80, height: 80)
    public var username: String?
    public var letterFont: UIFont = UIFont.systemFont(ofSize: 16.0)
    public var letterColor: UIColor = LAKUIColorByRGB(red: 236, green: 240, blue: 241)
    public var backgroundColors: [UIColor] = UIColor.colors
}

@objc(LAKLetterAvatarBuilder)
open class LetterAvatarBuilder: NSObject {
    open func makeAvatar(withConfiguration configuration: LetterAvatarBuilderConfiguration) -> UIImage? {
        let colors = configuration.backgroundColors
        guard let username = configuration.username else {
            return drawAvatar(
                size: configuration.size,
                letters: "NA",
                letterFont: configuration.letterFont,
                letterColor: configuration.letterColor,
                fillColor: colors[0].cgColor
            )
        }
        
        let usernameInfo = obtainUserNameInfo(withUsername: username)
        var colorIndex = usernameInfo.value
        colorIndex *= 3557 // The prime number
        colorIndex %= colors.count - 1
        return drawAvatar(
            size: configuration.size,
            letters: usernameInfo.letters,
            letterFont: configuration.letterFont,
            letterColor: configuration.letterColor,
            fillColor: colors[colorIndex].cgColor
        )
    }
    
    private func obtainUserNameInfo(withUsername username: String) -> (letters: String, value: Int) {
        var letters = String()
        var lettersAssciValue = 0
        let nameComponents = username.components(separatedBy: " ")
        for component in nameComponents {
            if let letter = component.first {
                letters.append(letter)
                lettersAssciValue += letter.asciiValue
            }
        }
        return (letters: letters, value: lettersAssciValue)
    }
    
    private func drawAvatar(size: CGSize,
                            letters: String,
                            letterFont: UIFont,
                            letterColor: UIColor,
                            fillColor: CGColor) -> UIImage? {
        let rect = CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height)
        
        UIGraphicsBeginImageContextWithOptions(size, true, UIScreen.main.scale)
        if let context = UIGraphicsGetCurrentContext() {
            context.setFillColor(fillColor)
            context.fill(rect)
            
            let style = NSParagraphStyle.default.mutableCopy()
            #if swift(>=4.0)
                let attributes = [
                    NSAttributedStringKey.paragraphStyle: style,
                    NSAttributedStringKey.font: letterFont.withSize(min(size.height, size.width) / 2.0),
                    NSAttributedStringKey.foregroundColor: letterColor
                ]
                
                let lettersSize = letters.size(withAttributes: attributes)
            #else
                let attributes = [
                NSParagraphStyleAttributeName: style,
                NSFontAttributeName: letterFont.withSize(min(size.height, size.width) / 2.0),
                NSForegroundColorAttributeName: letterColor
                ]
                
                let lettersSize = letters.size(attributes: attributes)
            #endif
            
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
}

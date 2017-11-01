//
// UIImage+LetterAvatarKit.swift
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

extension UIImage {
    /// Makes an letter-based avatar image using given configuration.
    ///
    /// - Parameters:
    ///     - configuration: The configuration that uses to draw a
    /// letter-based avatar image.
    ///
    /// - Returns: An instance of UIImage
    @objc(lak_makeLetterAvatarWithConfiguration:)
    static open func makeLetterAvatar(withConfiguration configuration: LetterAvatarBuilderConfiguration) -> UIImage? {
        return LetterAvatarBuilder().makeAvatar(withConfiguration: configuration)
    }
    
    /// Makes an letter-based avatar image using given username.
    ///
    /// - Parameters:
    ///     - username: The username that uses to draw a
    /// letter-based avatar image.
    ///
    /// - Returns: An instance of UIImage
    @objc(lak_makeLetterAvatarWithUsername:)
    static open func makeLetterAvatar(withUsername username: String?) -> UIImage? {
        let configuration = LetterAvatarBuilderConfiguration()
        configuration.username = username
        return LetterAvatarBuilder().makeAvatar(withConfiguration: configuration)
    }
    
    /// Makes an letter-based avatar image using given username and size.
    ///
    /// - Parameters:
    ///     - username: The username that uses to draw a
    /// letter-based avatar image.
    ///     - size: The avatar size.
    ///
    /// - Returns: An instance of UIImage
    @objc(lak_makeLetterAvatarWithUsername:size:)
    static open func makeLetterAvatar(withUsername username: String?, size: CGSize) -> UIImage? {
        let configuration = LetterAvatarBuilderConfiguration()
        configuration.username = username
        configuration.size = size
        return LetterAvatarBuilder().makeAvatar(withConfiguration: configuration)
    }
}

//
//  UIImage+LetterAvatarKitTests.swift
//  LetterAvatarKitTests
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

import XCTest
import Foundation
@testable import LetterAvatarKit

class UIImageLetterAvatarKitTests: XCTestCase {
    func testAvatarBuild() {
        let avatarImage = UIImage.makeLetterAvatar(withUsername: "Letter Avatar")
        let testAvatarImage = UIImage(named: "LetterAvatarTestImage")
        XCTAssertEqual(avatarImage, testAvatarImage)
    }
    
    func testAvatarBuildWithCustomSize() {
        let size = CGSize(width: 100, height: 100)
        let avatarImage = UIImage.makeLetterAvatar(withUsername: "Letter Avatar", size: size)
        XCTAssertEqual(avatarImage?.size.width, size.width)
        XCTAssertEqual(avatarImage?.size.height, size.height)
    }
    
    func testAvatarBuildSingleLetterFlag() {
        // Make a configuration
        let configuration = LetterAvatarBuilderConfiguration()
        configuration.username = "Avatar Test"
        configuration.useSingleLetter = true
        // Make images
        let avatarImage = UIImage.makeLetterAvatar(withConfiguration: configuration)
        let testAvatarImage = UIImage(named: "LetterAvatarSingleLetterTestImage")
        // Test them
        XCTAssertEqual(avatarImage?.size.width, configuration.size.width)
        XCTAssertEqual(avatarImage?.size.height, configuration.size.height)
        XCTAssertEqual(avatarImage, testAvatarImage)
    }
    
    func testAvatarBuildWithConfiguration() {
        // Make a configuration
        let configuration = LetterAvatarBuilderConfiguration()
        configuration.username = "Letter Avatar"
        // Make images
        let avatarImage = UIImage.makeLetterAvatar(withConfiguration: configuration)
        let testAvatarImage = UIImage(named: "LetterAvatarTestImage")
        // Test them
        XCTAssertEqual(avatarImage?.size.width, configuration.size.width)
        XCTAssertEqual(avatarImage?.size.height, configuration.size.height)
        XCTAssertEqual(avatarImage!, testAvatarImage)
    }
    
    func testAvatarBuildWithOneWordUsername() {
        let avatarImage = UIImage.makeLetterAvatar(withUsername: "Avatar")
        let testAvatarImage = UIImage(named: "LetterAvatarOneWordTestImage")
        XCTAssertEqual(avatarImage, testAvatarImage)
    }
    
    func testAvatarBuildWithMoreThanTwoWordsUsername() {
        let avatarImage = UIImage.makeLetterAvatar(withUsername: "Letter Test Avatar")
        let testAvatarImage = UIImage(named: "LetterAvatarTestImage")
        XCTAssertNotEqual(avatarImage, testAvatarImage)
    }
    
    func testAvatarBuildWithOneWordUsernameAndSingleLetterFlag() {
        // Make a configuration
        let configuration = LetterAvatarBuilderConfiguration()
        configuration.username = "Avatar"
        configuration.useSingleLetter = true
        // Make images
        let avatarImage = UIImage.makeLetterAvatar(withConfiguration: configuration)
        let testAvatarImage = UIImage(named: "LetterAvatarSingleLetterTestImage")
        // Test them
        XCTAssertEqual(avatarImage, testAvatarImage)
    }
}

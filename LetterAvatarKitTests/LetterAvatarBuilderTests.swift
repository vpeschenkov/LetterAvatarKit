//
// LetterAvatarBuilderTests.swift
// LetterAvatarKitTests
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
@testable import LetterAvatarKit

class LetterAvatarBuilderTests: XCTestCase {
    func testAvatarBuild() {
        let configuration = LetterAvatarBuilderConfiguration()
        configuration.username = "Letter Avatar"
        let avatarImage = LetterAvatarBuilder().makeAvatar(with: configuration)
        XCTAssertEqual(avatarImage, UIImage(named: "LetterAvatarTestImage"))
    }
    
    func testAvatarBuildWithCustomSize() {
        let size = CGSize(width: 100, height: 100)
        let configuration = LetterAvatarBuilderConfiguration()
        configuration.username = "Letter Avatar"
        configuration.size = size
        let avatarImage = LetterAvatarBuilder().makeAvatar(with: configuration)
        XCTAssertTrue(avatarImage?.size.width == size.width)
        XCTAssertTrue(avatarImage?.size.height == size.height)
    }
    
    func testAvatarBuildSingleLetterFlag() {
        // Make a configuration
        let configuration = LetterAvatarBuilderConfiguration()
        configuration.username = "Avatar Test"
        configuration.useSingleLetter = true
        // Make images
        let avatarImage = LetterAvatarBuilder().makeAvatar(with: configuration)
        let testImage = UIImage(named: "LetterAvatarSingleLetterTestImage")
        // Test them
        XCTAssertTrue(avatarImage?.size.width == configuration.size.width)
        XCTAssertTrue(avatarImage?.size.height == configuration.size.height)
        XCTAssertEqual(avatarImage, testImage)
    }
    
    func testAvatarBuildWithEmptyUsername() {
        let configuration = LetterAvatarBuilderConfiguration()
        let avatarImage = LetterAvatarBuilder().makeAvatar(with: configuration)
        let testImage = UIImage(named: "LetterAvatarEmptyTestImage")
        XCTAssertEqual(avatarImage, testImage)
    }
    
    func testAvatarBuildWithOneWordUsername() {
        let configuration = LetterAvatarBuilderConfiguration()
        configuration.username = "Avatar"
        let avatarImage = LetterAvatarBuilder().makeAvatar(with: configuration)
        let testImage = UIImage(named: "LetterAvatarOneWordTestImage")
        XCTAssertEqual(avatarImage, testImage)
    }
    
    func testAvatarBuildWithMoreThanTwoWordsUsername() {
        let configuration = LetterAvatarBuilderConfiguration()
        configuration.username = "Letter Test Avatar"
        let avatarImage = LetterAvatarBuilder().makeAvatar(with: configuration)
        let testImage = UIImage(named: "LetterAvatarTestImage")
        XCTAssertNotEqual(avatarImage, testImage)
    }
    
    func testAvatarBuildWithOneWordUsernameAndSingleLetterFlag() {
        let configuration = LetterAvatarBuilderConfiguration()
        configuration.username = "Avatar"
        configuration.useSingleLetter = true
        let avatarImage = LetterAvatarBuilder().makeAvatar(with: configuration)
        let testImage = UIImage(named: "LetterAvatarSingleLetterTestImage")
        XCTAssertEqual(avatarImage, testImage)
    }
    
    func testAvatarBuildWithOnlyOneBackgroundColor() {
        let configuration = LetterAvatarBuilderConfiguration()
        configuration.username = "Avatar"
        configuration.useSingleLetter = true
        configuration.backgroundColors = [ .red ]
        let avatarImage = LetterAvatarBuilder().makeAvatar(with: configuration)
        XCTAssertNotNil(avatarImage)
    }
    
    /// If a single letter is passed as false but the string is a single char,
    /// this line fails due to out of bounds exception.
    /// https://github.com/vpeschenkov/LetterAvatarKit/issues/11
    func testAvatarBuildFailureCannotIncrementBeyondEndIndex() {
        let configuration = LetterAvatarBuilderConfiguration()
        configuration.username = "N"
        configuration.useSingleLetter = true
        configuration.backgroundColors = [ .red ]
        let avatarImage = LetterAvatarBuilder().makeAvatar(with: configuration)
        XCTAssertNotNil(avatarImage)
    }
}

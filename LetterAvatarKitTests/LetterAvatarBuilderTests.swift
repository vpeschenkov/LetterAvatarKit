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
        let avatarImage = LetterAvatarBuilder().makeAvatar(withConfiguration: configuration)
        XCTAssert(avatarImage!.isEqualToImage(UIImage(named: "LetterAvatarTestImage")))
    }
    
    func testAvatarBuildWithCustomSize() {
        let size = CGSize(width: 100, height: 100)
        let configuration = LetterAvatarBuilderConfiguration()
        configuration.username = "Letter Avatar"
        configuration.size = size
        let avatarImage = LetterAvatarBuilder().makeAvatar(withConfiguration: configuration)
        XCTAssertTrue(avatarImage?.size.width == size.width)
        XCTAssertTrue(avatarImage?.size.height == size.height)
    }
    
    func testAvatarBuildSingleLetterFlag() {
        let configuration = LetterAvatarBuilderConfiguration()
        configuration.username = "Avatar Test"
        configuration.singleLetter = true
        let avatarImage = LetterAvatarBuilder().makeAvatar(withConfiguration: configuration)
        XCTAssertNotNil(avatarImage)
        let testAvatarImage = UIImage(named: "LetterAvatarSingleLetterTestImage")
        XCTAssertNotNil(testAvatarImage)
        XCTAssertTrue(avatarImage?.size.width == configuration.size.width)
        XCTAssertTrue(avatarImage?.size.height == configuration.size.height)
        XCTAssert(avatarImage!.isEqualToImage(testAvatarImage))
    }
    
    func testAvatarBuildWithEmptyUsername() {
        let configuration = LetterAvatarBuilderConfiguration()
        let avatarImage = LetterAvatarBuilder().makeAvatar(withConfiguration: configuration)
        XCTAssertNotNil(avatarImage)
        let testAvatarImage = UIImage(named: "LetterAvatarEmptyTestImage")
        XCTAssert(avatarImage!.isEqualToImage(testAvatarImage))
    }
    
    func testAvatarBuildWithOneWordUsername() {
        let configuration = LetterAvatarBuilderConfiguration()
        configuration.username = "Avatar"
        let avatarImage = LetterAvatarBuilder().makeAvatar(withConfiguration: configuration)
        XCTAssertNotNil(avatarImage)
        let testAvatarImage = UIImage(named: "LetterAvatarOneWordTestImage")
        XCTAssert(avatarImage!.isEqualToImage(testAvatarImage))
    }
    
    func testAvatarBuildWithMoreThanTwoWordsUsername() {
        let configuration = LetterAvatarBuilderConfiguration()
        configuration.username = "Letter Test Avatar"
        let avatarImage = LetterAvatarBuilder().makeAvatar(withConfiguration: configuration)
        XCTAssertNotNil(avatarImage)
        let testAvatarImage = UIImage(named: "LetterAvatarTestImage")
        XCTAssert(avatarImage!.isEqualToImage(testAvatarImage))
    }
    
    func testAvatarBuildWithOneWordUsernameAndSingleLetterFlag() {
        let configuration = LetterAvatarBuilderConfiguration()
        configuration.username = "Avatar"
        configuration.singleLetter = true
        let avatarImage = LetterAvatarBuilder().makeAvatar(withConfiguration: configuration)
        XCTAssertNotNil(avatarImage)
        let testAvatarImage = UIImage(named: "LetterAvatarSingleLetterTestImage")
        XCTAssert(avatarImage!.isEqualToImage(testAvatarImage))
    }
    
    func testAvatarBuildWithOnlyOneBackgroundColor() {
        let configuration = LetterAvatarBuilderConfiguration()
        configuration.username = "Avatar"
        configuration.singleLetter = true
        configuration.backgroundColors = [ .red ]
        let avatarImage = LetterAvatarBuilder().makeAvatar(withConfiguration: configuration)
        XCTAssertNotNil(avatarImage)
    }
    
    /// If single Letter is passed as false but the string is a single char,
    /// this line fails due to out of bounds exception.
    /// https://github.com/vpeschenkov/LetterAvatarKit/issues/11
    func testAvatarBuildFailureCannotIncrementBeyondEndIndex() {
        let configuration = LetterAvatarBuilderConfiguration()
        configuration.username = ""
//        configuration.singleLetter = false
        configuration.backgroundColors = [ .red ]
        let avatarImage = LetterAvatarBuilder().makeAvatar(withConfiguration: configuration)
        XCTAssertNotNil(avatarImage)
    }
}

//
//  LetterAvatarMakerTests.swift
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
@testable import LetterAvatarKit

class LetterAvatarMakerTests: XCTestCase {
    func testAvatarBuild() {
        let avatarImage = LetterAvatarMaker()
            .setUsername("Letter Avatar")
            .build()
        let testImage = UIImage(named: "LetterAvatarTestImage")
        XCTAssertEqual(avatarImage, testImage)
    }
    
    func testAvatarBuildWithCustomSize() {
        let size = CGSize(width: 100, height: 100)
        let avatarImage = LetterAvatarMaker()
            .setUsername("Letter Avatar")
            .setSize(size)
            .build()
        XCTAssertTrue(avatarImage?.size.width == size.width)
        XCTAssertTrue(avatarImage?.size.height == size.height)
    }
    
    func testAvatarBuildSingleLetterFlag() {
        // Make images
        let avatarImage = LetterAvatarMaker()
            .setUsername("Avatar Test")
            .setSingleLettered(true)
            .build()
        let testImage = UIImage(named: "LetterAvatarSingleLetterTestImage")
        XCTAssertEqual(avatarImage, testImage)
    }
    
    func testAvatarBuildWithEmptyUsername() {
        let avatarImage = LetterAvatarMaker().build()
        let testImage = UIImage(named: "LetterAvatarEmptyTestImage")
        XCTAssertEqual(avatarImage, testImage)
    }
    
    func testAvatarBuildWithOneWordUsername() {
        let avatarImage = LetterAvatarMaker()
            .setUsername("Avatar")
            .build()
        let testImage = UIImage(named: "LetterAvatarOneWordTestImage")
        XCTAssertEqual(avatarImage, testImage)
    }
    
    func testAvatarBuildWithMoreThanTwoWordsUsername() {
        let avatarImage = LetterAvatarMaker()
            .setUsername("Letter Test Avatar")
            .build()
        let testImage = UIImage(named: "LetterAvatarTestImage")
        XCTAssertNotEqual(avatarImage, testImage)
    }
    
    func testAvatarBuildWithOneWordUsernameAndSingleLetterFlag() {
        let avatarImage = LetterAvatarMaker()
            .setUsername("Avatar")
            .setSingleLettered(true)
            .build()
        let testImage = UIImage(named: "LetterAvatarSingleLetterTestImage")
        XCTAssertEqual(avatarImage, testImage)
    }
    
    func testAvatarBuildWithOnlyOneBackgroundColor() {
        let avatarImage = LetterAvatarMaker()
            .setUsername("Avatar")
            .setSingleLettered(true)
            .setBackgroundColors([ .red ])
            .build()
        XCTAssertNotNil(avatarImage)
    }
    
    /// If a single letter is passed as false but the string is a single char,
    /// this line fails due to out of bounds exception.
    /// https://github.com/vpeschenkov/LetterAvatarKit/issues/11
    func testAvatarBuildFailureCannotIncrementBeyondEndIndex() {
        let avatarImage = LetterAvatarMaker()
            .setUsername("N")
            .setSingleLettered(true)
            .setBackgroundColors([ .red ])
            .build()
        XCTAssertNotNil(avatarImage)
    }
    
    func testAvatarBuildWithClosure() {
        let avatarImage = LetterAvatarMaker()
            .build { c in
                c.username = "Letter Avatar"
        }
        let testImage = UIImage(named: "LetterAvatarTestImage")
        XCTAssertEqual(avatarImage, testImage)
    }
}

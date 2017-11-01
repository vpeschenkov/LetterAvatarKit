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
        XCTAssertNotNil(avatarImage)
        
        let testAvatarImage = UIImage(named: "LetterAvatarTestImage")
        XCTAssertNotNil(testAvatarImage)
        XCTAssert(avatarImage!.isEqualToAnotherImage(image: testAvatarImage!))
    }
    
    func testAvatarBuildWithCustomSize() {
        let size = CGSize(width: 100, height: 100)
        let avatarImage = UIImage.makeLetterAvatar(withUsername: "Letter Avatar", size: size)
        XCTAssertTrue(avatarImage?.size.width == size.width)
        XCTAssertTrue(avatarImage?.size.height == size.height)
    }
    
    func testAvatarBuildSingleLetterFlag() {
        let configuration = LetterAvatarBuilderConfiguration()
        configuration.username = "Avatar Test"
        configuration.singleLetter = true
        
        let avatarImage = UIImage.makeLetterAvatar(withConfiguration: configuration)
        XCTAssertNotNil(avatarImage)
        
        let testAvatarImage = UIImage(named: "LetterAvatarSingleLetterTestImage")
        XCTAssertNotNil(testAvatarImage)
        
        XCTAssertTrue(avatarImage?.size.width == configuration.size.width)
        XCTAssertTrue(avatarImage?.size.height == configuration.size.height)
        XCTAssert(avatarImage!.isEqualToAnotherImage(image: testAvatarImage!))
    }
    
    func testAvatarBuildWithConfiguration() {
        let configuration = LetterAvatarBuilderConfiguration()
        configuration.username = "Letter Avatar"
        let avatarImage = UIImage.makeLetterAvatar(withConfiguration: configuration)
        XCTAssertNotNil(avatarImage)
        
        let testAvatarImage = UIImage(named: "LetterAvatarTestImage")
        XCTAssertNotNil(testAvatarImage)
        
        XCTAssertTrue(avatarImage?.size.width == configuration.size.width)
        XCTAssertTrue(avatarImage?.size.height == configuration.size.height)
        XCTAssert(avatarImage!.isEqualToAnotherImage(image: testAvatarImage!))
    }
    
    func testAvatarBuildWithOneWordUsername() {
        let avatarImage = UIImage.makeLetterAvatar(withUsername: "Avatar")
        XCTAssertNotNil(avatarImage)
        
        let testAvatarImage = UIImage(named: "LetterAvatarOneWordTestImage")
        XCTAssertNotNil(testAvatarImage)
        
        XCTAssert(avatarImage!.isEqualToAnotherImage(image: testAvatarImage!))
    }
    
    func testAvatarBuildWithMoreThanTwoWordsUsername() {
        let avatarImage = UIImage.makeLetterAvatar(withUsername: "Letter Test Avatar")
        XCTAssertNotNil(avatarImage)
        
        let testAvatarImage = UIImage(named: "LetterAvatarTestImage")
        XCTAssertNotNil(testAvatarImage)
        
        XCTAssert(avatarImage!.isEqualToAnotherImage(image: testAvatarImage!))
    }
    
    func testAvatarBuildWithOneWordUsernameAndSingleLetterFlag() {
        let configuration = LetterAvatarBuilderConfiguration()
        configuration.username = "Avatar"
        configuration.singleLetter = true
        
        let avatarImage = UIImage.makeLetterAvatar(withConfiguration: configuration)
        XCTAssertNotNil(avatarImage)
        
        let testAvatarImage = UIImage(named: "LetterAvatarSingleLetterTestImage")
        XCTAssertNotNil(testAvatarImage)
        
        XCTAssert(avatarImage!.isEqualToAnotherImage(image: testAvatarImage!))
    }
    
}

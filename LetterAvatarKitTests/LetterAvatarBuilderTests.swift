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
        let builder = LetterAvatarBuilder()
        let configuration = LetterAvatarBuilderConfiguration()
        configuration.username = "Letter Avatar"
        let avatarImage = builder.makeAvatar(withConfiguration: configuration)
        XCTAssertNotNil(avatarImage)
        
        let bundle = Bundle(for: type(of: self) as AnyClass)
        let testAvatarImage = UIImage(
            named: "LetterAvatarTestImage",
            in: bundle,
            compatibleWith: nil
        )
        XCTAssert(avatarImage!.isEqualToAnotherImage(image: testAvatarImage!))
    }
    
    func testEmptyAvatarBuild() {
        let builder = LetterAvatarBuilder()
        let configuration = LetterAvatarBuilderConfiguration()
        let avatarImage = builder.makeAvatar(withConfiguration: configuration)
        XCTAssertNotNil(avatarImage)
        
        let bundle = Bundle(for: type(of: self) as AnyClass)
        let testAvatarImage = UIImage(
            named: "LetterAvatarEmptyTestImage",
            in: bundle,
            compatibleWith: nil
        )
        XCTAssert(avatarImage!.isEqualToAnotherImage(image: testAvatarImage!))
    }
    
    func testAvatarBuildWithSize() {
        let size = CGSize(width: 100, height: 100)
        let builder = LetterAvatarBuilder()
        let configuration = LetterAvatarBuilderConfiguration()
        configuration.username = "Letter Avatar"
        configuration.size = size
        let avatarImage = builder.makeAvatar(withConfiguration: configuration)
        
        XCTAssertTrue(avatarImage?.size.width == size.width)
        XCTAssertTrue(avatarImage?.size.height == size.height)
    }
}

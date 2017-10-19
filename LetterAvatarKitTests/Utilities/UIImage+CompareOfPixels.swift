//
//  UIImage+CompareOfPixels.swift
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

import UIKit
import Foundation

extension UIImage {
    func isEqualToAnotherImage(image: UIImage, density: CGFloat = 0.001, accuracy: Double = 0.01) -> Bool {
        if !self.size.equalTo(image.size) {
            return false
        }
        
        let pixelsWidth: Int = self.cgImage!.width
        let pixelsHeight: Int = self.cgImage!.height
        let pixelsToCompare: Int  = Int(CGFloat(pixelsWidth * pixelsHeight) * density)
        
        var pixel1 = UInt()
        let context1 = CGContext(
            data: &pixel1,
            width: 1,
            height: 1,
            bitsPerComponent: 8,
            bytesPerRow: 4,
            space: CGColorSpaceCreateDeviceRGB(),
            bitmapInfo: CGImageAlphaInfo.noneSkipFirst.rawValue
        )
        
        var pixel2 = UInt()
        let context2 = CGContext(data: &pixel2,
                                 width: 1,
                                 height: 1,
                                 bitsPerComponent: 8,
                                 bytesPerRow: 4,
                                 space: CGColorSpaceCreateDeviceRGB(),
                                 bitmapInfo: CGImageAlphaInfo.noneSkipFirst.rawValue
        )
        
        var misses = 0
        for _ in 0..<pixelsToCompare {
            let pixelX = Int(arc4random()) % pixelsWidth
            let pixelY = Int(arc4random()) % pixelsHeight
            
            context1?.draw(self.cgImage!, in: CGRect(x: CGFloat(-pixelX), y: CGFloat(-pixelY), width: CGFloat(pixelsWidth), height: CGFloat(pixelsHeight)))
            context2?.draw(image.cgImage!, in: CGRect(x: CGFloat(-pixelX), y: CGFloat(-pixelY), width: CGFloat(pixelsWidth), height: CGFloat(pixelsHeight)))

            if pixel1 != pixel2 {
                misses += 1
            }
        }

        return (Double(misses / pixelsToCompare) <= accuracy);
    }
}

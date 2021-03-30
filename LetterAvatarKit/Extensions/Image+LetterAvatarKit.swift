//
//  Image+LetterAvatarKit.swift
//  LetterAvatarKit
//
//  Created by Victor Peschenkov on 3/30/21.
//  Copyright © 2021 Victor Peschenkov. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, *)
extension Image {
    
    init(configuration: LetterAvatarBuilderConfiguration) {
        self.init(uiImage: LetterAvatarBuilder().makeAvatar(with: configuration) ?? UIImage())
    }
    
    init(username: String, size: CGSize = CGSize(width: 80.0, height: 80.0)) {
        let configuration = LetterAvatarBuilderConfiguration()
        configuration.username = username
        configuration.size = size
        self.init(uiImage: LetterAvatarBuilder().makeAvatar(with: configuration) ?? UIImage())
    }
}

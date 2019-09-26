Pod::Spec.new do |spec|
  spec.name             = 'LetterAvatarKit'
  spec.platform         = :ios, '8.0'
  spec.version          = '1.2.0'
  spec.license          = { :type => 'MIT' }
  spec.homepage         = 'https://github.com/vpeschenkov/LetterAvatarKit'
  spec.authors          = { 'Viktor Peschenkov' => 'v.peschenkov@gmail.com' }
  spec.summary          = 'An extension that generates letter-based avatars written in Swift'
  spec.source           = { :git => 'https://github.com/vpeschenkov/LetterAvatarKit.git', :tag => spec.version.to_s }
  spec.source_files     = 'LetterAvatarKit/*.{h,swift}', 'LetterAvatarKit/Extensions/*.{swift}'
  spec.requires_arc     = true
  spec.framework        = 'Foundation', 'UIKit'
  spec.swift_version    = '5.0'
end

Pod::Spec.new do |s|
  s.name             = 'LetterAvatarKit'
  s.platform         = :ios, '8.0'
  s.version          = '1.0.1'
  s.license          = { :type => 'MIT' }
  s.homepage         = 'https://github.com/vpeschenkov/LetterAvatarKit'
  s.authors          = { 'Victor Peschenkov' => 'nerevarxx@gmail.com' }
  s.summary          = 'UIImage extension that generates letter-based avatars written in Swift.'
  s.source           = { :git => 'https://github.com/vpeschenkov/LetterAvatarKit.git', :tag => s.version.to_s }
  s.source_files     = 'LetterAvatarKit/*.{h,swift}', 'LetterAvatarKit/Extensions/*.{swift}'
  s.requires_arc     = true
  s.framework        = 'Foundation', 'UIKit'
end

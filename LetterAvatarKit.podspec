Pod::Spec.new do |spec|
  spec.name             = 'LetterAvatarKit'
  spec.ios.deployment_target = '12.0'
  spec.tvos.deployment_target = '12.0'
  spec.version          = '2.0.0'
  spec.license          = { :type => 'MIT' }
  spec.homepage         = 'https://github.com/vpeschenkov/LetterAvatarKit'
  spec.authors          = { 'Viktor Peschenkov' => 'v.peschenkov@gmail.com' }
  spec.summary          = 'Beautiful deterministic letter avatars for iOS and tvOS'
  spec.description      = <<-DESC
    LetterAvatarKit is a lightweight UIKit-first Swift library for generating
    polished UIImage avatars from names, usernames, initials, emails, and
    placeholders. It is ideal for chat apps, contact lists, teams, profiles,
    onboarding flows, and identity fallback images with customizable colors,
    fonts, borders, and circular or square rendering.
  DESC
  spec.source           = { :git => 'https://github.com/vpeschenkov/LetterAvatarKit.git', :tag => spec.version.to_s }
  spec.source_files     = 'LetterAvatarKit/*.swift', 'LetterAvatarKit/Extensions/*.swift'
  spec.requires_arc     = true
  spec.framework        = 'Foundation', 'UIKit'
  spec.swift_version    = '5.9'
  spec.documentation_url = 'https://github.com/vpeschenkov/LetterAvatarKit#readme'
  spec.social_media_url = 'https://www.linkedin.com/in/vpeschenkov/'
end

#!/bin/sh

set -e

bundle exec jazzy \
  -x -project,LetterAvatarKit.xcodeproj,-scheme,LetterAvatarKit,-sdk,iphonesimulator,CODE_SIGNING_ALLOWED=NO,USE_SWIFT_RESPONSE_FILE=NO \
  --clean \
  --author "Victor Peschenkov" \
  --author_url https://github.com/vpeschenkov \
  --github_url https://github.com/vpeschenkov/LetterAvatarKit \
  --include=/*/LetterAvatar*.*,/*/Extensions/UIImage* \
  --skip-undocumented \
  --output docs

#!/bin/sh

jazzy \
  -x USE_SWIFT_RESPONSE_FILE=NO \
  --clean \
  --author Victor Peschenkov \
  --author_url hhttps://github.com/vpeschenkov \
  --github_url https://github.com/vpeschenkov/LetterAvatarKit \
  --include=/*/LetterAvatar*.*,/*/Extensions/UIImage* \
  --skip-undocumented \
  --output docs

#!/bin/sh

jazzy \
  --clean \
  --author Victor Peschenkov \
  --author_url hhttps://github.com/vpeschenkov \
  --github_url https://github.com/vpeschenkov/LetterAvatarKit \
  --include=/*/LetterAvatarBuilder.*,/*/LetterAvatarBuilderConfiguration.*,/*/*/UIImage* \
  --output docs

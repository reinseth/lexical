#!/bin/sh

npm run prepare-release
grep --include "*/npm/*" -rl @lexical/markdown packages | xargs sed -i '' \
    -e 's/@lexical\/markdown/@reinseth\/lexical-markdown/g' \
    -e 's/@lexical\/react/@reinseth\/lexical-react/g' \
    -e 's/facebook\/lexical.git/reinseth\/lexical.git#fix-export-of-formatted-whitespace-fork/g'
(cd packages/lexical-markdown/npm && npm publish --access public)
(cd packages/lexical-react/npm && npm publish --access public)

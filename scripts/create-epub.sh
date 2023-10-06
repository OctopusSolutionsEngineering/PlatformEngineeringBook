#!/bin/bash

pushd .. || exit
jekyll build --config config.yml

pushd _site/book || exit
# find . -name '*.png' -exec mogrify -resize 50% {} +
if [ -f MyBook.epub ]; then
    rm MyBook.epub
fi
echo -n "application/epub+zip" > mimetype
zip -0Xq "MyBook.epub" "mimetype"
zip -Xr9Dq "MyBook.epub" * -x "mimetype" -x "scripts/*" -x README.md -x *.odt -x LICENSE -x pdf-cover.*
popd || exit
popd || exit
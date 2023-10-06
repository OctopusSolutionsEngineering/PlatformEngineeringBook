#!/bin/bash

pushd .. || exit
jekyll build --config config-kdp.yml

pushd _site/kdp || exit

# Remove links in the book - this can't be printed anyway
cp book.html book2.html
perl -0777pe 's%<a[ \r\n]+href="[^"]*">(.*?)</a>%<span class="underline">$1</span>%sg' book2.html > book.html

# find . -name '*.png' -exec mogrify -resize 50% {} +
if [ -f MyBook.epub ]; then
    rm MyBook.epub
fi
echo -n "application/epub+zip" > mimetype
zip -0Xq "MyBookKDP.epub" "mimetype"
zip -Xr9Dq "MyBookKDP.epub" * -x "mimetype" -x "scripts/*" -x README.md -x book2.html -x README.md -x *.odt -x LICENSE -x pdf-cover.*
popd || exit
popd || exit
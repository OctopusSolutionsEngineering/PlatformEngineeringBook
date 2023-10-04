#!/bin/bash

# This script requires calibre. Install with:
# sudo -v && wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sudo sh /dev/stdin

pushd .. || exit
ebook-convert  _site/book/MyBook.epub _site/book/MyBook.pdf --pdf-sans-family 'Helvetica' --pdf-serif-family 'Helvetica' --pdf-default-font-size 12 --pdf-mono-font-size 12 --cover 'pdf-cover.png'
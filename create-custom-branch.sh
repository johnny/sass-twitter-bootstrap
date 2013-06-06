#!/bin/sh

VERSION=`git describe --abbrev=0`
git checkout -b custom-$VERSION
git checkout customizations lib/sass-twitter-bootstrap.rb
cd lib
mkdir bootstrap
mv _* bootstrap
mv bootstrap.scss _bootstrap.scss
mv responsive.scss _responsive.scss
echo '@import "bootstrap";' > bootstrap.scss
echo '@import "responsive";' > responsive.scss
sed -i 's/@import "/@import "bootstrap\//g' _responsive.scss _bootstrap.scss
git add _bootstrap.scss _responsive.scss bootstrap
git commit -am "applied customizations for #{VERSION}"

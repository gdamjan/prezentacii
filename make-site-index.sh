#! /bin/bash

set -eu

DEST=$1

# install dependencies (revealjs) in $DEST
pnpm install --prod --modules-dir $DEST/node_modules --virtual-store-dir $DEST/node_modules/.pnpm

# now create a reveal presentation listing all the presentations
echo "### Some presentations I've done thru the years…" > $DEST/README.md

for f in [!_]*/index.html; do
  d=`dirname $f`
  cp -r $d -t $DEST/
  echo "---" >> $DEST/README.md
  echo "## [$d](./$d/index.html)" >> $DEST/README.md
done

# last slide
echo "---"  >> $DEST/README.md
echo "# end." >> $DEST/README.md

cp index.html favicon.ico -t $DEST/

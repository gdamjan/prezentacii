#! /bin/bash

set -eu

DEST=$1

pnpm install --prod --modules-dir $DEST/node_modules --virtual-store-dir $DEST/node_modules/.pnpm

echo -e "# start" > $DEST/README.md
for f in [!_]*/index.html; do
  d=`dirname $f`
  cp -r $d -t $DEST/
  echo -e "## [$d](./$d/index.html)\n---" >> $DEST/README.md
done
echo -e "# end." >> $DEST/README.md

cp favicon.ico $DEST/
cp index.html $DEST/

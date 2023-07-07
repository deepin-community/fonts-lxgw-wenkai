#!/bin/bash

set -e

BUILDDIR="fonts/TTF"

mkdir -pv $BUILDDIR
for f in sources/*.ufoz
do
echo "Building font $f"
fontmake -u "$f" --keep-overlaps --keep-direction --no-generate-GDEF --no-production-names -o ttf --output-dir $BUILDDIR
echo "END"
done

echo "Modifying MONO average width..."
python3 sources/fix_mono.py $BUILDDIR

#!/bin/sh

cd `dirname $0`
DIR=`pwd`

echo $DIR/../

$DIR/../frameworks/runtime-src/proj.mac/bin/dltest.app/Contents/MacOS/dltest \
--width 1136 \
--height 640 \
--scale 75 \
--log \
--writedir /assets/output \

exit 0
#!/bin/sh
# Add a lock icon and text to the center of an image
convert ./9.png -font Liberation-Sans \
    -pointsize 26 -fill white -gravity center \
    -annotate +0+160 "Type Password to Unlock" lock.png \
    -gravity center -composite newimage.png

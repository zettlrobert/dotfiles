#!/bin/sh
sed -i \
         -e 's/rgb(0%,0%,0%)/#172133/g' \
         -e 's/rgb(100%,100%,100%)/#b2b2b2/g' \
    -e 's/rgb(50%,0%,0%)/#172133/g' \
     -e 's/rgb(0%,50%,0%)/#72a5ff/g' \
 -e 's/rgb(0%,50.196078%,0%)/#72a5ff/g' \
     -e 's/rgb(50%,0%,50%)/#1c293f/g' \
 -e 's/rgb(50.196078%,0%,50.196078%)/#1c293f/g' \
     -e 's/rgb(0%,0%,50%)/#d4dae5/g' \
	"$@"

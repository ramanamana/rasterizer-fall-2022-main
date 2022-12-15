#!/bin/bash
for f in ../test-vectors/*sv*.dat;
 do printf "\n\nProcessing file: %s\n" "$f"; 
 ./rasterizer_gold `basename $f`_out.ppm $f;
 printf "\nDifferences (if any): ";
 diff `basename $f`_out.ppm ${f%.*}_ref.ppm;
 printf "\n";
done

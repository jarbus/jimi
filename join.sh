#!/bin/bash
# DIR="chords"
DIR="notes"
OUTFILE="all-$DIR.tokens"


rm $OUTFILE
for file in $DIR/*
do
    tr '\n' ' ' < $file >> $OUTFILE
    echo '\n' >> $OUTFILE
done

#!/bin/bash
DIR="notes"
fairseq-preprocess \
    --only-source \
    --trainpref train/$DIR.tokens \
    --validpref val/$DIR.tokens \
    --testpref test/$DIR.tokens \
    --destdir data-bin/notes/ \
    --workers 20

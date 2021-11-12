#!/bin/bash
python transpose.py prompt.txt prompt_transposed.txt

tr '\n' ' ' < prompt_transposed.txt > prompt_joined.txt

fairseq-interactive "data-bin/notes" \
--fp16 \
--path "checkpoints/conv-model/checkpoint_best.pt" \
--results-path "results/gensh-output" \
--task language_modeling \
--skip-invalid-size-inputs-valid-test \
--input "prompt_joined.txt" \
--quiet \
--nbest 1 \
--beam 20 > "results/gensh-output/output.txt"

rm prompt_transposed.txt
rm prompt_joined.txt

grep -oP "D-\S*\s*\S*\s*\K.*" "results/gensh-output/output.txt" | tr ' ' '\n' > results/gensh-output/output2.txt
python transpose.py results/gensh-output/output2.txt results/gensh-output/output3.txt

cat results/gensh-output/output3.txt

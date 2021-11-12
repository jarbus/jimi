fairseq-train --task language_modeling \
data-bin/notes \
--save-dir checkpoints/conv-model \
--skip-invalid-size-inputs-valid-test \
--arch fconv_lm \
--dropout 0.1 \
--optimizer adam --adam-betas '(0.9, 0.98)' --weight-decay 0.01 --clip-norm 0.0 \
--lr 0.005 --lr-scheduler inverse_sqrt --warmup-updates 4000 --warmup-init-lr 1e-07 \
--tokens-per-sample 1024 --sample-break-mode none \
--max-tokens 1024 --update-freq 16 \
--memory-efficient-fp16 \
--max-update 50000 \
--no-epoch-checkpoints \
--batch-size 512 \
--restore-file /home/jack/drive/grad/s3/nlps/final/jimi/checkpoints/conv-model/checkpoint_last.pt

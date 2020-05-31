#!/bin/sh

################################3
# Scenario 1
# This is the deepSAD Configuration
# to add --load_model ../log/mnist/model_0_1_16.tar --load_ae_only True\
for normal_class in 0
do
	for unknown_class in 0 1
	do
		if [ $normal_class -eq $unknown_class ]; then
      		continue
	    fi
	    for dims in 16 32 64 256 512
	    do
			CUDA_VISIBLE_DEVICES=3 python main.py mnist mnist_LeNet ../log/mnist/scenario_5/deepSAD/ ../data  \
			--ratio_known_outlier 0.05 --ratio_pollution 0.1 \
			--lr 0.0001 --n_epochs 150 --lr_milestone 50 --batch_size 200 --weight_decay 0.5e-6 --pretrain True --ae_lr 0.0001 --ae_n_epochs 150 \
			--ae_batch_size 200 --ae_weight_decay 0.5e-3 --normal_class $normal_class --known_outlier_class $unknown_class --eta 1. \
			--n_known_outlier_classes 1 --seed 0 --n_jobs_dataloader 6 --case 5 --feat_dims $dims
		done
	done
done

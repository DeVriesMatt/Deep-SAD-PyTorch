#!/bin/sh

################################3
# Scenario 1
# This is the deepSAD Configuration

for normal_class in 8 9
do
	for unknown_class in 8 9
	do
		if [ $normal_class -eq $unknown_class ]; then
      		continue
	    fi
		for eta in 0.01 0.1 10 100
		do

			CUDA_VISIBLE_DEVICES=2 python main.py fmnist fmnist_LeNet ../log/fmnist/scenario_4/deepSAD ../data \
			--load_model ../log/fmnist/scenario_1/deepSAD/model_0_1_1_0.tar \
      --load_ae_only True\
			--ratio_known_outlier 0.05 --ratio_pollution 0.1 \
			--lr 0.0001 --n_epochs 150 --lr_milestone 50 --batch_size 200 --weight_decay 0.5e-6 --pretrain True --ae_lr 0.0001 --ae_n_epochs 150 \
			--ae_batch_size 200 --ae_weight_decay 0.5e-3 --normal_class 9 --known_outlier_class 9 --eta $eta \
			--n_known_outlier_classes 1 --seed 0 --n_jobs_dataloader 6 --case 4

		done
	done
done

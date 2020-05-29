#!/bin/sh

################################3
# Scenario 1
# This is the deepSAD Configuration
for normal_class in 1
do
    for unknown_class in 6 7 8 9
    do
        if [ $normal_class -eq $unknown_class ]; then
              continue
        fi
        for gamma_l in 0.01 0.05 0.1
        do
            CUDA_VISIBLE_DEVICES=2 python main.py fmnist fmnist_LeNet ../log/fmnist/scenario_1/deepSAD/ ../data \
            --load_model ../log/fmnist/scenario_1/deepSAD/model_0_1_1_0.tar \
      --load_ae_only True\
            --ratio_known_outlier $gamma_l --ratio_pollution 0.1 \
            --lr 0.0001 --n_epochs 150 --lr_milestone 50 --batch_size 200 --weight_decay 0.5e-6 --pretrain True --ae_lr 0.0001 --ae_n_epochs 150 \
            --ae_batch_size 200 --ae_weight_decay 0.5e-3 --normal_class $normal_class --known_outlier_class $unknown_class \
            --n_known_outlier_classes 1 --seed 0 --n_jobs_dataloader 6 --case 1

        done
    done
done

for normal_class in 2 3 4 5
do
	for unknown_class in 0 1 2 3 4 5 6 7 8 9
	do
		if [ $normal_class -eq $unknown_class ]; then
      		continue
	    fi
		for gamma_l in 0.01 0.05 0.1 
		do
			CUDA_VISIBLE_DEVICES=2 python main.py fmnist fmnist_LeNet ../log/fmnist/scenario_1/deepSAD/ ../data \
			--load_model ../log/fmnist/scenario_1/deepSAD/model_0_1_1_0.tar \
      --load_ae_only True\
			--ratio_known_outlier $gamma_l --ratio_pollution 0.1 \
			--lr 0.0001 --n_epochs 150 --lr_milestone 50 --batch_size 200 --weight_decay 0.5e-6 --pretrain True --ae_lr 0.0001 --ae_n_epochs 150 \
			--ae_batch_size 200 --ae_weight_decay 0.5e-3 --normal_class $normal_class --known_outlier_class $unknown_class \
			--n_known_outlier_classes 1 --seed 0 --n_jobs_dataloader 6 --case 1

		done
	done
done

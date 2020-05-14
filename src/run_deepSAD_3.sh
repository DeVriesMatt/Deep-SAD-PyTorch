#!/bin/sh

################################3


for normal_class in 0 1 2 3 4 5 6 7 8 9
do
	for seed in 0 1 2 3 4 5 6 7 8 9
	do
		for kappa in 2 3 5
		do
			python main.py cifar10 cifar10_LeNet ../log/cifar-10/scenario_3/deepSAD/ ../data --ratio_known_outlier 0.05 --ratio_pollution 0.1 \
			--lr 0.0001 --n_epochs 150 --lr_milestone 50 --batch_size 200 --weight_decay 0.5e-6 --pretrain True --ae_lr 0.0001 --ae_n_epochs 150 \
			--ae_batch_size 200 --ae_weight_decay 0.5e-3 --normal_class $normal_class --known_outlier_class 0 \
			--n_known_outlier_classes $kappa --seed $seed --n_jobs_dataloader 6 --case 3
		done
	done
done


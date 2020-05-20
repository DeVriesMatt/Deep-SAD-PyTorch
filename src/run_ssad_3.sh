#!/bin/sh

################################3


for normal_class in 0 1 2 3 4 5 6 7 8 9
do
	for seed in 0 1 2 3 4 5 6 7 8 9
	do
		for kappa in 2 3 5
		do
			python baseline_ssad.py fmnist ../log/fmnist/scenario_3/ssad_raw ../data \
				--ratio_known_outlier 0.05 \
				--ratio_pollution 0.1 \
				--kernel rbf \
				--kappa 1.0 \
				--normal_class $normal_class \
				--known_outlier_class 0 \
				--n_known_outlier_classes $kappa \
				--seed $seed \
				--case 3 \
				--n_jobs_dataloader 8;

			python baseline_ssad.py cifar10 ../log/fmnist/scenario_3/ssad_hybrid ../data \
				--ratio_known_outlier 0.05 \
				--ratio_pollution 0.1 \
				--kernel rbf \
				--kappa 1.0 \
				--hybrid True \
				--load_ae ../log/cifar-10/scenario_2/deepSAD/model_${normal_class}_${unknown_class}_005.tar \
				--normal_class $normal_class \
				--known_outlier_class 0 \
				--n_known_outlier_classes $kappa \
				--seed $seed \
				--case 3 \
				--n_jobs_dataloader 8;
		done
	done
done


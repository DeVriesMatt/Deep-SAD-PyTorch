#!/bin/sh

################################
# Scenario 1
# This is the deepSAD Configuration
for normal_class in 8
do
    for unknown_class in 4 5 6 7 8 9
    do
    if [ $normal_class -eq $unknown_class ]; then
        continue
    fi
        for gamma_l in 0.2
        do

            python baseline_ssad.py fmnist ../log/fmnist/scenario_1/ssad_hybrid ../data \
                --ratio_known_outlier $gamma_l \
                --ratio_pollution 0.1 \
                --kernel rbf \
                --kappa 1.0 \
                --hybrid True \
                --load_ae ../log/fmnist/scenario_1/deepSAD/model_${normal_class}_${unknown_class}_0.tar \
                --normal_class $normal_class \
                --known_outlier_class $unknown_class \
                --n_known_outlier_classes 1 \
                --seed 0 \
                --case 1 \
                --n_jobs_dataloader 6;

        done
    done
done
for normal_class in 9
do
	for unknown_class in 0 1 2 3 4 5 6 7 8 9
	do
    if [ $normal_class -eq $unknown_class ]; then
        continue
    fi
		for gamma_l in 0.2
		do

			python baseline_ssad.py fmnist ../log/fmnist/scenario_1/ssad_hybrid ../data \
				--ratio_known_outlier $gamma_l \
				--ratio_pollution 0.1 \
				--kernel rbf \
				--kappa 1.0 \
				--hybrid True \
				--load_ae ../log/fmnist/scenario_1/deepSAD/model_${normal_class}_${unknown_class}_0.tar \
				--normal_class $normal_class \
				--known_outlier_class $unknown_class \
				--n_known_outlier_classes 1 \
				--seed 0 \
				--case 1 \
				--n_jobs_dataloader 6;

		done
	done
done

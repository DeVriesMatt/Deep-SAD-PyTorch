#!/bin/sh

################################3
# Scenario 3
# ocsvm configuration for scneario 3
for normal_class in 0 1 2 3 4 5 6 7 8 9
do
	for unknown_class in 0 1 2 3 4 5 6 7 8 9
	do
		if [ $normal_class -eq $unknown_class ]; then
      		continue
    fi
		for kappa in 2 3 5
		do
	# 		# OC-SVM Hybrid
			python baseline_ocsvm.py fmnist ../log/fmnist/scenario_3/ocsvmHybrid ../data \
			--ratio_known_outlier 0.05 \
			--ratio_pollution 0.1 \
			--kernel rbf \
			--normal_class $normal_class \
			--known_outlier_class $unknown_class \
			--n_known_outlier_classes $kappa \
            --seed 0 \
			--hybrid True \
			--load_ae ../log/fmnist/scenario_3/deepSAD/model_${normal_class}_0_${kappa}_${unknown_class}.tar \
            --case 3 \
			--n_jobs_dataloader 8
		done
	done
done

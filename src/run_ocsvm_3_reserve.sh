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
		for kappa in 2 3 5 # QUESTION: WHAT ABOUT 0 AND 1
		do
			# OC-SVM
			CUDA_VISIBLE_DEVICES=3 python baseline_ocsvm.py mnist ../log/mnist/scenario_1/ocsvm_raw ../data \
				--ratio_known_outlier 0.05 \ #!
				--ratio_pollution 0.1 \
				--kernel rbf \
				--normal_class $normal_class \
				--known_outlier_class 0 \
				--n_known_outlier_classes $kappa \ #!
				--seed 0 \
                --case 3 \ #!
				--n_jobs_dataloader 8;

	# 		# OC-SVM Hybrid
			CUDA_VISIBLE_DEVICES=3 python baseline_ocsvm.py mnist ../log/mnist/scenario_1/ocsvm_hybrid ../data \
			--ratio_known_outlier 0.05 \ #!
			--ratio_pollution 0.1 \
			--kernel rbf \
			--normal_class $normal_class \
			--known_outlier_class 0 \
			--n_known_outlier_classes $kappa \ #!
            --seed 0 \
			--hybrid True \
			--load_ae ../log/mnist/scenario_3/deepSAD/model_${normal_class}_0_${kappa}_${seed}.tar \
            --case 3 \ #!
			--n_jobs_dataloader 8
		done
	done
done

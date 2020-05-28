#!/bin/sh

################################3
# Scenario 3
# ocsvm configuration for scneario 3
for normal_class in 4
do
    for seed in 4 5 6 7 8 9
    do
        for kappa in 5
        do
            # OC-SVM
            python baseline_ocsvm.py fmnist ../log/fmnist/scenario_3/ocsvm ../data \
                --ratio_known_outlier 0.05 \
                --ratio_pollution 0.1 \
                --kernel rbf \
                --normal_class $normal_class \
                --known_outlier_class 0 \
                --n_known_outlier_classes $kappa \
                --seed $seed \
                --case 3 \
                --n_jobs_dataloader 8;
        done
    done
done

for normal_class in 5 6 7 8 9
do
	for seed in 0 1 2 3 4 5 6 7 8 9
	do
		for kappa in 2 3 5
		do
			# OC-SVM
			python baseline_ocsvm.py fmnist ../log/fmnist/scenario_3/ocsvm ../data \
				--ratio_known_outlier 0.05 \
				--ratio_pollution 0.1 \
				--kernel rbf \
				--normal_class $normal_class \
				--known_outlier_class 0 \
				--n_known_outlier_classes $kappa \
				--seed $seed \
                --case 3 \
				--n_jobs_dataloader 8;

	# 		# OC-SVM Hybrid
#			python baseline_ocsvm.py fmnist ../log/fmnist/scenario_3/ocsvmHybrid ../data \
#			--ratio_known_outlier 0.05 \
#			--ratio_pollution 0.1 \
#			--kernel rbf \
#			--normal_class $normal_class \
#			--known_outlier_class 0 \
#			--n_known_outlier_classes $kappa \
#      --seed $seed \
#			--hybrid True \
#			--load_ae ../log/fmnist/scenario_3/deepSAD/model_${normal_class}_0_${kappa}_${seed}.tar \
#            --case 3 \
#			--n_jobs_dataloader 8;
		done
	done
done

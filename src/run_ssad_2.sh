#!/bin/sh

################################3
# Scenario 2
# This is the deepSAD Configuration
for normal_class in  3 4 5 6 7 8 9
do
	for unknown_class in 0 1 2 3 4 5 6 7 8 9
	do
		if [ $normal_class -eq $unknown_class ]; then
      		continue
	    fi
		for gamma_p in 0. 0.01 0.05 0.1 0.2
		do
			 python baseline_ssad.py fmnist ../log/fmnist/scenario_2/ssad_raw ../data \
			 	--ratio_known_outlier 0.05 \
			 	--ratio_pollution $gamma_p \
			 	--kernel rbf \
			 	--kappa 1.0 \
			 	--normal_class $normal_class \
			 	--known_outlier_class $unknown_class \
			 	--n_known_outlier_classes 1 \
			 	--seed 0 \
			 	--case 2 \
			 	--n_jobs_dataloader 8;

			python baseline_ssad.py fmnist ../log/fmnist/scenario_2/ssad_hybrid ../data \
				--ratio_known_outlier 0.05 \
				--ratio_pollution $gamma_p \
				--kernel rbf \
				--kappa 1.0 \
				--hybrid True \
				--load_ae ../log/fmnist/scenario_2/deepSAD/model_${normal_class}_${unknown_class}_005.tar \
				--normal_class $normal_class \
				--known_outlier_class $unknown_class \
				--n_known_outlier_classes 1 \
				--seed 0 \
				--case 2 \
				--n_jobs_dataloader 8;
		done
	done
done

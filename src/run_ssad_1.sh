#!/bin/sh

################################3
# Scenario 1
# This is the ssad Configuration
for normal_class in 0 1 2 3 4 5 6 7 8 9
do
	for unknown_class in 0 1 2 3 4 5 6 7 8 9
	do
		if [ $normal_class -eq $unknown_class ]; then
      		continue
	    fi
		for gamma_l in 0.01 0.05 0.1 0.2
		do
			CUDA_VISIBLE_DEVICES=1 python baseline_ssad.py fmnist ../log/fmnist/scenario_1/ssad/ ../data --ratio_known_outlier $gamma_l --ratio_pollution 0.1 \
		  --kernel rbf --kappa 1.0 --hybrid False --load_ae ../log/DeepSAD/fashion_mnist_test/model.tar --normal_class $normal_class \
		  --known_outlier_class $unknown_class \
			--n_known_outlier_classes 1 --seed 0 --n_jobs_dataloader 6 --case 1

		done
	done
done


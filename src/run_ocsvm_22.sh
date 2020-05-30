#!/bin/sh

#  run_ocsvm_22.sh
#  
#
#  Created by Matt De Vries on 29/05/2020.
#
for normal_class in 8
do
    for unknown_class in 2 3 4 5 6 7 8 9
    do
        if [ $normal_class -eq $unknown_class ]; then
              continue
        fi
        for gamma_p in 0. 0.01 0.05 0.1 0.2
        do
#          OC-SVM
            python baseline_ocsvm.py fmnist ../log/fmnist/scenario_2/ocsvm ../data \
            --ratio_known_outlier 0.05 \
            --ratio_pollution $gamma_p \
            --kernel rbf \
            --normal_class $normal_class \
            --known_outlier_class $unknown_class \
            --n_known_outlier_classes 1 \
            --seed 0 \
      --case 2 \
            --n_jobs_dataloader 8;
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
        for gamma_p in 0. 0.01 0.05 0.1 0.2
        do
#          OC-SVM
            python baseline_ocsvm.py fmnist ../log/fmnist/scenario_2/ocsvm ../data \
            --ratio_known_outlier 0.05 \
            --ratio_pollution $gamma_p \
            --kernel rbf \
            --normal_class $normal_class \
            --known_outlier_class $unknown_class \
            --n_known_outlier_classes 1 \
            --seed 0 \
      --case 2 \
            --n_jobs_dataloader 8;
        done
    done
done

#!/bin/sh

#  run_ocsvm_3_missing_raw.sh
#  
#
#  Created by Matt De Vries on 31/05/2020.
#
for normal_class in 0
do
    for seed in 0 1 2 3 4 5 6 7
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
        done
    done
done

for normal_class in 2
do
    for seed in 9
    do
        for kappa in 2 3
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

for normal_class in 3
do
    for seed in 6 7 8 9
    do
        for kappa in 2 3
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

for normal_class in 4 5
do
    for seed in 5 6 7 8 9
    do
        for kappa in 2 3
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

for normal_class in 6
do
    for seed in 2 3 4 5 6 7 8 9
    do
        for kappa in 2 3
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

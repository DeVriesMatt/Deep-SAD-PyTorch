#!/bin/sh

################################3
# Scenario 5
# This SSAD Configuration
for normal_class in 8
do
    for unknown_class in 9
    do
        if [ $normal_class -eq $unknown_class ]; then
              continue
      fi
        for dims in 32 64 256 512
        do
            python baseline_ssad.py fmnist ../log/fmnist/scenario_5/ssad_raw ../data \
                --ratio_known_outlier 0.05 \
                --ratio_pollution 0.1 \
                --kernel rbf \
                --kappa 1.0 \
                --normal_class $normal_class \
                --known_outlier_class $unknown_class \
                --n_known_outlier_classes 1 \
                --seed 0 \
                --feat_dims $dims \
                --case 5 \
                --n_jobs_dataloader 8;
        done
    done
done

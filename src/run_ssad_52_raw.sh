#!/bin/sh

#  run_ssad_52_raw.sh
#  
#
#  Created by Matt De Vries on 29/05/2020.
#  
for normal_class in 9
do
    for unknown_class in 0 1 2 3 4 5 6 7 8 9
    do
        if [ $normal_class -eq $unknown_class ]; then
              continue
      fi
        for dims in 16 32 64 256 512
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

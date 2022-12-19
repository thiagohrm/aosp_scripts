#!/bin/bash -el
productName=$1
flavour=$2
previous_target_file_path=$3

incremental_build() {
    echo "**********************Initiating Incremental Build**********************"
    PREVIOUS_TARGET_FILE=${previous_target_file_path}/${productName}-target_files-${flavour}.zip
    ./build/tools/releasetools/ota_from_target_files -i ${previous_target_file_path}/${productName}-target_files-${flavour}.zip \
     dist_output/${productName}-target_files-${flavour}.zip  dist_output/incremental_ota_${flavour}.zip
}

cd ${WORKSPACE}/aosp
incremental_build

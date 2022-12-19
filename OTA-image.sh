#!/bin/bash -el
productName=$1
flavour=$2
aosp_path=""

OTA_build() { # Needs previous system image to be present.
    echo "**********************Initiating OTA Build**********************"
    ./build/tools/releasetools/ota_from_target_files dist_output/${productName}-target_files-${flavour}.zip dist_output/full_ota_${flavour}.zip
}

cd ${aosp_path}
OTA_Build

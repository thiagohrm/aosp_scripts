!/bin/bash -el
productName=$1
flavour=$2

# Setup environment (Step 1)
environment_Setup() {
    echo "**********************Initiating Environment**********************"
    source build/envsetup.sh
    lunch ${productName}-${flavour}
}

#System Image build (Step 2)
system_image() {
    echo "**********************Initiating System Image Build **********************"
    make dist DIST_DIR=dist_output -j16
    TARGET_FILE=dist_output/${productName}-target_files.zip
    echo $TARGET_FILE
    if [ ! -f "$TARGET_FILE" ]; then
        echo "BUILD FAILURE. Please check for the build errors"
        exit 1
    fi
}

#Post Build Setup  (Step 3)
post_build_setup() {
    echo "**********************Initiating post Build Setup**********************"
    cd dist_output/
    unzip ${productName}-target_files-${flavour}.zip -d ${productName}-target_files-${flavour}
    mkdir system_image_${flavour}
    cp -r ${productName}-target_files-${flavour}/IMAGES/*.img system_image_${flavour}
    zip -r system_image_${flavour}.zip system_image_${flavour}/
}

#Execution Sequence
cd ${WORKSPACE}/aosp
environment_Setup
system_image
post_build_setup

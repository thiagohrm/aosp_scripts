#!/bin/bash -el
aosp_path=""
cd ${aosp_path}
source build/envsetup.sh    # setup environment for make clobber
make clobber

#!/bin/bash -el
cd ${WORKSPACE}/aosp
source build/envsetup.sh    # setup environment for make clobber
make clobber

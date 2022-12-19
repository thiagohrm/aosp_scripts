#!/bin/bash -el
aosp_path="{$WORKSPACE}"
cd aosp
source build/envsetup.sh    # setup environment for make clobber
make clobber

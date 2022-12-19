#!/bin/bash +x
cd ${WORKSPACE}
mkdir aosp
cd aosp
git config --global user.name Your Name
git config --global user.email you@example.com
repo init -u https://android.googlesource.com/platform/manifest -b android-9.0.0_r1
repo sync -j8

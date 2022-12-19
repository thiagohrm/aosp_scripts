#!/bin/bash -el
repo forall -c "pwd && git checkout develop"
repo forall -c "pwd && git merge master"

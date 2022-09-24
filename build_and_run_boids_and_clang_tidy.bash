#!/bin/bash

./build.xsh --build_dir YOUR_PROJECT_NAME --build_missing_conan --build_type Release

if [ $? -ne 0 ]; then
echo Compilation failed
else
echo Compilation success, running YOUR_PROJECT_NAME
(cd YOUR_PROJECT_NAME/build/Release/bin/ ; ./YOUR_PROJECT_NAME)
fi
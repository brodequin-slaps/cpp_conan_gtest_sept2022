#!/usr/bin/env xonsh

$CC = '/usr/bin/gcc-11'
$CXX = '/usr/bin/g++-11'

import argparse

parser = argparse.ArgumentParser(description='build either test or YOUR_PROJECT_NAME')
parser.add_argument("--build_dir", type=str, choices=['YOUR_PROJECT_NAME', 'test'], 
                        help='Which directory to build')

parser.add_argument("--build_all_conan", dest='build_all', action='store_true', 
                help='build all with conan')

parser.add_argument("--build_missing_conan", dest='build_all', action='store_false', 
                help='build missing with conan')

parser.set_defaults(build_all=False)

parser.add_argument("--build_type", type=str, choices=['Debug', 'Release'], 
                        help='Debug or Release?')

args = parser.parse_args()

mkdir -p @(args.build_dir)/build/@(args.build_type)

cd @(args.build_dir)/build/@(args.build_type)

if not args.build_all:
    conan install ../.. --build=missing
else:
    conan install ../.. -b


cmake ../.. -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=@(args.build_type)
state = !(script -qc "cmake --build .")

#used for next script to know if compilation was success or failure
exit(state.returncode)
#Standalone library definition and installation
#Does not change compiler warnings!

cmake_minimum_required(VERSION 3.10)

# set the project name
project(YOUR_PROJECT_NAME VERSION 0.1)

# specify the C++ standard
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED True)

#file copying from main source directory to build binary directory
#configure_file(frag.glsl bin/frag.glsl)

add_compile_options(-Wall -Wextra -pedantic -fno-exceptions
    "$<$<CONFIG:DEBUG>:-O0;-g3;-ggdb>"
    "$<$<CONFIG:RELEASE>:-Ofast>")

#run clang-tidy
#set(CMAKE_CXX_CLANG_TIDY 
#    clang-tidy;
#    -checks=-cppcoreguidelines-avoid-magic-numbers; #everything but magic numbers
#    -header-filter=.*;)

#needed to have access to our own project headers
include_directories(..)

include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
conan_basic_setup()

# add the executable
add_executable(YOUR_PROJECT_NAME 
    main.cpp 
    helpers.cpp
)

#link to conan libs
target_link_libraries(YOUR_PROJECT_NAME ${CONAN_LIBS})

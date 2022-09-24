#Standalone unit tests definition

cmake_minimum_required(VERSION 3.10)
project(YOUR_PROJECT_NAMETests)

# specify the C++ standard
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED True)

#dependencies
include(CTest)

#needed to have access to our own project headers
include_directories(..)

#find_package(GTest MODULE REQUIRED)

#here, we only want to find package if we run the standalone tests.
#if we are being run from top level, we already know about YOUR_PROJECT_NAME package
#and we wont enter in the if branch.

#if(NOT TARGET geranim0::YOUR_PROJECT_NAME)
#    find_package(YOUR_PROJECT_NAME CONFIG REQUIRED)
#endif()
#
##target definition
#add_executable(YOUR_PROJECT_NAMETests tests.cpp)
#target_link_libraries(YOUR_PROJECT_NAMETest
#    PRIVATE
#        geranim0::YOUR_PROJECT_NAME
#        GTest::Main
#)
#
#add_test(NAME YOUR_PROJECT_NAME.UnitTests
#    COMMAND YOUR_PROJECT_NAMETests
#)


#testing testing
#enable_testing()

include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
conan_basic_setup()

add_executable(
    YOUR_PROJECT_NAMETests
  ../YOUR_PROJECT_NAME/helpers.cpp
  example.test.cpp
)

TARGET_LINK_LIBRARIES(${PROJECT_NAME} ${CONAN_LIBS})

include(GoogleTest)
gtest_discover_tests(YOUR_PROJECT_NAMETests)
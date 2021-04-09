cmake_minimum_required(VERSION 3.15)
project(ModularProjectTemplate)

set(CMAKE_CXX_STANDARD 17)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

list(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake)
include(Submodule)
include(GenerateMetaInfo)
include(UpdateBuildTime)

add_subdirectory(src)
add_subdirectory(test)
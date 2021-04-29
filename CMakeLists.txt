cmake_minimum_required(VERSION 3.15)
cmake_policy(SET CMP0015 NEW)

project(ModularProjectTemplate)

set(CMAKE_CXX_STANDARD 17)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

list(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake)
include(Submodule)
include(GenerateMetaInfo)
include(UpdateBuildTime)
include(ReadVersion)
include(SetOutputPath)
include(PrintTargetProperties)

generate_version_file(APP_NAME MyApp APP_ORG MyOrganization)

add_subdirectory(src)
add_subdirectory(test)
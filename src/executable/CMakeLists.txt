set_submodule_executable(CMake Executable)
generate_meta_info(
        META_FILE
        MODULE_NAME ${CURRENT_MODULE_NAME}
        PRODUCT_NAME ${CURRENT_PREFIX_NAME}
        ORIGINAL_FILE_NAME ${CURRENT_PREFIX_NAME}.${CURRENT_MODULE_NAME}
        PRODUCT_VERSION ${GENERAL_VERSION})
target_sources(${CURRENT_MODULE_TARGET} PRIVATE ${META_FILE})

# use generator expression to make only release build will update build time header before build process
set_build_time_header(TARGET ${CURRENT_MODULE_TARGET} $<$<STREQUAL:${CMAKE_BUILD_TYPE},Release>:EACH_BUILD>)
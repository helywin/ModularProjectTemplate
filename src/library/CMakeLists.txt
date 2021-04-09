set_submodule_library(CMake Library)
if (WIN32)
    generate_meta_info(
            META_FILE
            MODULE_NAME ${CURRENT_MODULE_NAME}
            PRODUCT_NAME ${CURRENT_PREFIX_NAME}
            ORIGINAL_FILE_NAME ${CURRENT_PREFIX_NAME}.${CURRENT_MODULE_NAME}
            PRODUCT_VERSION ${GENERAL_VERSION})
    target_sources(${CURRENT_MODULE_TARGET} PRIVATE ${META_FILE})
endif ()
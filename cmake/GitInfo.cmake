include(FindGit)
if (${GIT_FOUND})
    unset(GIT_VERSION_NUM CACHE)
    unset(GIT_BRANCH CACHE)
    message("Found Git executable, version: ${GIT_VERSION_STRING}")
    execute_process(
            COMMAND ${GIT_EXECUTABLE} describe --tags --exact-match --abbrev=0
            WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}
            OUTPUT_VARIABLE GIT_TAG
            OUTPUT_STRIP_TRAILING_WHITESPACE
            RESULT_VARIABLE GIT_VERSION_RESULT
    )
    if (NOT ${GIT_VERSION_RESULT} EQUAL 0)
        set(GIT_STATUS "u")
        set(GIT_TAG "notag")
    else ()
        set(GIT_VERSION_STATUS "")
    endif ()

    execute_process(
            COMMAND ${GIT_EXECUTABLE} log -1 --format=%H
            WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}
            OUTPUT_VARIABLE GIT_COMMIT
            OUTPUT_STRIP_TRAILING_WHITESPACE
            RESULT_VARIABLE GIT_COMMIT_RESULT
    )
    if (NOT GIT_COMMIT_RESULT EQUAL 0)
        message(FATAL_ERROR "cannot find git commit number")
    else ()
        message("git commit: ${GIT_COMMIT}")
    endif ()

    execute_process(
            COMMAND ${GIT_EXECUTABLE} rev-parse --abbrev-ref HEAD
            WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}
            OUTPUT_VARIABLE GIT_BRANCH
            OUTPUT_STRIP_TRAILING_WHITESPACE
            RESULT_VARIABLE GIT_BRANCH_RESULT
    )
    if (NOT GIT_BRANCH_RESULT EQUAL 0)
        message(WARNING "cannot find git branch name")
    else ()
        message("git branch: ${GIT_BRANCH}")
    endif ()

    set(GIT_STATUS ${GIT_STATUS} CACHE INTERNAL "git version status")
    set(GIT_COMMIT ${GIT_COMMIT} CACHE INTERNAL "git commit number")
    set(GIT_BRANCH ${GIT_BRANCH} CACHE INTERNAL "git branch name")
else ()
    MESSAGE(WARNING "cannot find Git executable, skip git version check")
    set(GIT_COMMIT "unknown")
    set(GIT_BRANCH "unknown")
endif ()

#unset(DATE CACHE)
#string(TIMESTAMP DATE "%b %d %Y %a %H:%M:%S")
#set(DATE "${DATE}")
#message("compile date: ${DATE}")
#set(GIT_DATE ${DATE})
#
# ucm.cmake - useful cmake macros
#
# Copyright (c) 2016 Viktor Kirilov
#
# Distributed under the MIT Software License
# See accompanying file LICENSE.txt or copy at
# https://opensource.org/licenses/MIT
#
# The documentation can be found at the library's page:
# https://github.com/onqtam/ucm

cmake_minimum_required(VERSION 2.8.12)

include(CMakeParseArguments)

# ucm_add_flags
# Adds compiler flags to CMAKE_<LANG>_FLAGS or to a specific config
macro(ucm_add_flags)
    cmake_parse_arguments(ARG "C;CXX;CLEAR_OLD" "" "CONFIG" ${ARGN})

    if(NOT ARG_CONFIG)
        set(ARG_CONFIG " ")
    endif()

    foreach(CONFIG ${ARG_CONFIG})
        # determine to which flags to add
        if(NOT ${CONFIG} STREQUAL " ")
            string(TOUPPER ${CONFIG} CONFIG)
            set(CXX_FLAGS CMAKE_CXX_FLAGS_${CONFIG})
            set(C_FLAGS CMAKE_C_FLAGS_${CONFIG})
        else()
            set(CXX_FLAGS CMAKE_CXX_FLAGS)
            set(C_FLAGS CMAKE_C_FLAGS)
        endif()

        # clear the old flags
        if(${ARG_CLEAR_OLD})
            if("${ARG_CXX}" OR NOT "${ARG_C}")
                set(${CXX_FLAGS} "")
            endif()
            if("${ARG_C}" OR NOT "${ARG_CXX}")
                set(${C_FLAGS} "")
            endif()
        endif()

        # add all the passed flags
        foreach(flag ${ARG_UNPARSED_ARGUMENTS})
            if("${ARG_CXX}" OR NOT "${ARG_C}")
                set(${CXX_FLAGS} "${${CXX_FLAGS}} ${flag}")
            endif()
            if("${ARG_C}" OR NOT "${ARG_CXX}")
                set(${C_FLAGS} "${${C_FLAGS}} ${flag}")
            endif()
        endforeach()
    endforeach()

endmacro()

# ucm_set_flags
# Sets the CMAKE_<LANG>_FLAGS compiler flags or for a specific config
macro(ucm_set_flags)
    ucm_add_flags(CLEAR_OLD ${ARGN})
endmacro()

# ucm_add_linker_flags
# Adds linker flags to CMAKE_<TYPE>_LINKER_FLAGS or to a specific config
macro(ucm_add_linker_flags)
    cmake_parse_arguments(ARG "CLEAR_OLD;EXE;MODULE;SHARED;STATIC" "" "CONFIG" ${ARGN})

    if(NOT ARG_CONFIG)
        set(ARG_CONFIG " ")
    endif()

    foreach(CONFIG ${ARG_CONFIG})
        string(TOUPPER "${CONFIG}" CONFIG)

        if(NOT ${ARG_EXE} AND NOT ${ARG_MODULE} AND NOT ${ARG_SHARED} AND NOT ${ARG_STATIC})
            set(ARG_EXE 1)
            set(ARG_MODULE 1)
            set(ARG_SHARED 1)
            set(ARG_STATIC 1)
        endif()

        set(flags_configs "")
        if(${ARG_EXE})
            if(NOT "${CONFIG}" STREQUAL " ")
                list(APPEND flags_configs CMAKE_EXE_LINKER_FLAGS_${CONFIG})
            else()
                list(APPEND flags_configs CMAKE_EXE_LINKER_FLAGS)
            endif()
        endif()
        if(${ARG_MODULE})
            if(NOT "${CONFIG}" STREQUAL " ")
                list(APPEND flags_configs CMAKE_MODULE_LINKER_FLAGS_${CONFIG})
            else()
                list(APPEND flags_configs CMAKE_MODULE_LINKER_FLAGS)
            endif()
        endif()
        if(${ARG_SHARED})
            if(NOT "${CONFIG}" STREQUAL " ")
                list(APPEND flags_configs CMAKE_SHARED_LINKER_FLAGS_${CONFIG})
            else()
                list(APPEND flags_configs CMAKE_SHARED_LINKER_FLAGS)
            endif()
        endif()
        if(${ARG_STATIC})
            if(NOT "${CONFIG}" STREQUAL " ")
                list(APPEND flags_configs CMAKE_STATIC_LINKER_FLAGS_${CONFIG})
            else()
                list(APPEND flags_configs CMAKE_STATIC_LINKER_FLAGS)
            endif()
        endif()

        # clear the old flags
        if(${ARG_CLEAR_OLD})
            foreach(flags ${flags_configs})
                set(${flags} "")
            endforeach()
        endif()

        # add all the passed flags
        foreach(flag ${ARG_UNPARSED_ARGUMENTS})
            foreach(flags ${flags_configs})
                set(${flags} "${${flags}} ${flag}")
            endforeach()
        endforeach()
    endforeach()
endmacro()

# ucm_set_linker_flags
# Sets the CMAKE_<TYPE>_LINKER_FLAGS linker flags or for a specific config
macro(ucm_set_linker_flags)
    ucm_add_linker_flags(CLEAR_OLD ${ARGN})
endmacro()

# ucm_gather_flags
# Gathers all lists of flags for printing or manipulation
macro(ucm_gather_flags with_linker result)
    set(${result} "")
    # add the main flags without a config
    list(APPEND ${result} CMAKE_C_FLAGS)
    list(APPEND ${result} CMAKE_CXX_FLAGS)
    if(${with_linker})
        list(APPEND ${result} CMAKE_EXE_LINKER_FLAGS)
        list(APPEND ${result} CMAKE_MODULE_LINKER_FLAGS)
        list(APPEND ${result} CMAKE_SHARED_LINKER_FLAGS)
        list(APPEND ${result} CMAKE_STATIC_LINKER_FLAGS)
    endif()

    if("${CMAKE_CONFIGURATION_TYPES}" STREQUAL "" AND NOT "${CMAKE_BUILD_TYPE}" STREQUAL "")
        # handle single config generators - like makefiles/ninja - when CMAKE_BUILD_TYPE is set
        string(TOUPPER ${CMAKE_BUILD_TYPE} config)
        list(APPEND ${result} CMAKE_C_FLAGS_${config})
        list(APPEND ${result} CMAKE_CXX_FLAGS_${config})
        if(${with_linker})
            list(APPEND ${result} CMAKE_EXE_LINKER_FLAGS_${config})
            list(APPEND ${result} CMAKE_MODULE_LINKER_FLAGS_${config})
            list(APPEND ${result} CMAKE_SHARED_LINKER_FLAGS_${config})
            list(APPEND ${result} CMAKE_STATIC_LINKER_FLAGS_${config})
        endif()
    else()
        # handle multi config generators (like msvc, xcode)
        foreach(config ${CMAKE_CONFIGURATION_TYPES})
            string(TOUPPER ${config} config)
            list(APPEND ${result} CMAKE_C_FLAGS_${config})
            list(APPEND ${result} CMAKE_CXX_FLAGS_${config})
            if(${with_linker})
                list(APPEND ${result} CMAKE_EXE_LINKER_FLAGS_${config})
                list(APPEND ${result} CMAKE_MODULE_LINKER_FLAGS_${config})
                list(APPEND ${result} CMAKE_SHARED_LINKER_FLAGS_${config})
                list(APPEND ${result} CMAKE_STATIC_LINKER_FLAGS_${config})
            endif()
        endforeach()
    endif()
endmacro()

# ucm_set_runtime
# Sets the runtime (static/dynamic) for msvc/gcc
macro(ucm_set_runtime)
    cmake_parse_arguments(ARG "STATIC;DYNAMIC" "" "" ${ARGN})

    if(ARG_UNPARSED_ARGUMENTS)
        message(FATAL_ERROR "unrecognized arguments: ${ARG_UNPARSED_ARGUMENTS}")
    endif()

    if(CMAKE_CXX_COMPILER_ID MATCHES "Clang" STREQUAL "")
        message(AUTHOR_WARNING "ucm_set_runtime() does not support clang yet!")
    endif()

    ucm_gather_flags(0 flags_configs)

    # add/replace the flags
    # note that if the user has messed with the flags directly this function might fail
    # - for example if with MSVC and the user has removed the flags - here we just switch/replace them
    if("${ARG_STATIC}")
        foreach(flags ${flags_configs})
            if(CMAKE_CXX_COMPILER_ID MATCHES "GNU")
                if(NOT ${flags} MATCHES "-static-libstdc\\+\\+")
                    set(${flags} "${${flags}} -static-libstdc++")
                endif()
                if(NOT ${flags} MATCHES "-static-libgcc")
                    set(${flags} "${${flags}} -static-libgcc")
                endif()
            elseif(MSVC)
                if(${flags} MATCHES "/MD")
                    string(REGEX REPLACE "/MD" "/MT" ${flags} "${${flags}}")
                endif()
            endif()
        endforeach()
    elseif("${ARG_DYNAMIC}")
        foreach(flags ${flags_configs})
            if(CMAKE_CXX_COMPILER_ID MATCHES "GNU")
                if(${flags} MATCHES "-static-libstdc\\+\\+")
                    string(REGEX REPLACE "-static-libstdc\\+\\+" "" ${flags} "${${flags}}")
                endif()
                if(${flags} MATCHES "-static-libgcc")
                    string(REGEX REPLACE "-static-libgcc" "" ${flags} "${${flags}}")
                endif()
            elseif(MSVC)
                if(${flags} MATCHES "/MT")
                    string(REGEX REPLACE "/MT" "/MD" ${flags} "${${flags}}")
                endif()
            endif()
        endforeach()
    endif()
endmacro()

# ucm_print_flags
# Prints all compiler flags for all configurations
macro(ucm_print_flags)
    ucm_gather_flags(1 flags_configs)
    message("")
    foreach(flags ${flags_configs})
        message("${flags}: ${${flags}}")
    endforeach()
    message("")
endmacro()

# Adds all files from directories traversing them recursively to a list of sources
# and generates filters according to their location (accepts relative paths only).
# Also this macro trims X times the front word from the filter string for visual studio filters.
macro(ucm_add_dirs)
    cmake_parse_arguments(ARG "RECURSIVE" "TO;FILTER_POP" "ADDITIONAL_EXT" ${ARGN})

    if(${ARG_TO} STREQUAL "")
        message(FATAL_ERROR "Need to pass TO and a variable name to ucm_add_dirs()")
    endif()

    if("${ARG_FILTER_POP}" STREQUAL "")
        set(ARG_FILTER_POP 0)
    endif()

    ucm_add_dir_impl(${ARG_TO} ${ARG_RECURSIVE} ${ARG_FILTER_POP} "${ARG_UNPARSED_ARGUMENTS}" "${ARG_ADDITIONAL_EXT}")
endmacro()

# ucm_add_target
# Adds a target eligible for cotiring - unity build and/or precompiled header
macro(ucm_add_target)
    cmake_parse_arguments(ARG "UNITY" "NAME;TYPE;PCH_FILE;CPP_PER_UNITY" "UNITY_EXCLUDED;SOURCES" ${ARGN})

    if(NOT "${ARG_UNPARSED_ARGUMENTS}" STREQUAL "")
        message(FATAL_ERROR "Unrecognized options passed to ucm_add_target()")
    endif()
    if("${ARG_NAME}" STREQUAL "")
        message(FATAL_ERROR "Need to pass NAME and a name for the target to ucm_add_target()")
    endif()
    set(valid_types EXECUTABLE STATIC SHARED MODULE)
    list(FIND valid_types "${ARG_TYPE}" is_type_valid)
    if(${is_type_valid} STREQUAL "-1")
        message(FATAL_ERROR "Need to pass TYPE and the type for the target [EXECUTABLE/STATIC/SHARED/MODULE] to ucm_add_target()")
    endif()
    if("${ARG_SOURCES}" STREQUAL "")
        message(FATAL_ERROR "Need to pass SOURCES and a list of source files to ucm_add_target()")
    endif()

    # init with the global unity flag
    set(do_unity ${UCM_UNITY_BUILD})

    # check the UNITY argument
    if(NOT ARG_UNITY)
        set(do_unity FALSE)
    endif()

    # if target is excluded through the exclusion list
    list(FIND UCM_UNITY_BUILD_EXCLUDE_TARGETS ${ARG_NAME} is_target_excluded)
    if(NOT ${is_target_excluded} STREQUAL "-1")
        set(do_unity FALSE)
    endif()

    # unity build only for targets with > 1 source file (otherwise there will be an additional unnecessary target)
    if(do_unity) # optimization
        ucm_count_sources(${ARG_SOURCES} RESULT num_sources)
        if(${num_sources} LESS 2)
            set(do_unity FALSE)
        endif()
    endif()

    set(wanted_cotire ${do_unity})

    # if cotire cannot be used
    if(do_unity AND NOT ucm_with_cotire)
        set(do_unity FALSE)
    endif()

    # inform the developer that the current target might benefit from a unity build
    if(NOT ARG_UNITY AND ${UCM_UNITY_BUILD})
        ucm_count_sources(${ARG_SOURCES} RESULT num_sources)
        if(${num_sources} GREATER 1)
            message(AUTHOR_WARNING "Target '${ARG_NAME}' may benefit from a unity build.\nIt has ${num_sources} sources - enable with UNITY flag")
        endif()
    endif()

    # prepare for the unity build
    set(orig_target ${ARG_NAME})
    if(do_unity)
        # the original target will be added with a different name than the requested
        set(orig_target ${ARG_NAME}_ORIGINAL)

        # exclude requested files from unity build of the current target
        foreach(excluded_file "${ARG_UNITY_EXCLUDED}")
            set_source_files_properties(${excluded_file} PROPERTIES COTIRE_EXCLUDED TRUE)
        endforeach()
    endif()

    # add the original target
    if(${ARG_TYPE} STREQUAL "EXECUTABLE")
        add_executable(${orig_target} ${ARG_SOURCES})
    else()
        add_library(${orig_target} ${ARG_TYPE} ${ARG_SOURCES})
    endif()

    if(do_unity)
        # set the number of unity cpp files to be used for the unity target
        if(NOT "${ARG_CPP_PER_UNITY}" STREQUAL "")
            set_property(TARGET ${orig_target} PROPERTY COTIRE_UNITY_SOURCE_MAXIMUM_NUMBER_OF_INCLUDES "${ARG_CPP_PER_UNITY}")
        else()
            set_property(TARGET ${orig_target} PROPERTY COTIRE_UNITY_SOURCE_MAXIMUM_NUMBER_OF_INCLUDES "100")
        endif()

        if(NOT "${ARG_PCH_FILE}" STREQUAL "")
            set_target_properties(${orig_target} PROPERTIES COTIRE_CXX_PREFIX_HEADER_INIT "${ARG_PCH_FILE}")
        else()
            set_target_properties(${orig_target} PROPERTIES COTIRE_ENABLE_PRECOMPILED_HEADER FALSE)
        endif()
        # add a unity target for the original one with the name intended for the original
        set_target_properties(${orig_target} PROPERTIES COTIRE_UNITY_TARGET_NAME ${ARG_NAME})

        # this is the library call that does the magic
        cotire(${orig_target})
        set_target_properties(clean_cotire PROPERTIES FOLDER "CMakePredefinedTargets")

        # disable the original target and enable the unity one
        get_target_property(unity_target_name ${orig_target} COTIRE_UNITY_TARGET_NAME)
        set_target_properties(${orig_target} PROPERTIES EXCLUDE_FROM_ALL 1 EXCLUDE_FROM_DEFAULT_BUILD 1)
        set_target_properties(${unity_target_name} PROPERTIES EXCLUDE_FROM_ALL 0 EXCLUDE_FROM_DEFAULT_BUILD 0)

        # also set the name of the target output as the original one
        set_target_properties(${unity_target_name} PROPERTIES OUTPUT_NAME ${ARG_NAME})
        if(UCM_NO_COTIRE_FOLDER)
            # reset the folder property so all unity targets dont end up in a single folder in the solution explorer of VS
            set_target_properties(${unity_target_name} PROPERTIES FOLDER "")
        endif()
        set_target_properties(all_unity PROPERTIES FOLDER "CMakePredefinedTargets")
    elseif(NOT "${ARG_PCH_FILE}" STREQUAL "")
        set(wanted_cotire TRUE)
        if(ucm_with_cotire)
            set_target_properties(${orig_target} PROPERTIES COTIRE_ADD_UNITY_BUILD FALSE)
            set_target_properties(${orig_target} PROPERTIES COTIRE_CXX_PREFIX_HEADER_INIT "${ARG_PCH_FILE}")
            cotire(${orig_target})
            set_target_properties(clean_cotire PROPERTIES FOLDER "CMakePredefinedTargets")
        endif()
    endif()

    # print a message if the target was requested to be cotired but it couldn't
    if(wanted_cotire AND NOT ucm_with_cotire)
        if(NOT COMMAND cotire)
            message(AUTHOR_WARNING "Target \"${ARG_NAME}\" not cotired because cotire isn't loaded")
        else()
            message(AUTHOR_WARNING "Target \"${ARG_NAME}\" not cotired because cotire is older than the required version")
        endif()
    endif()
endmacro()
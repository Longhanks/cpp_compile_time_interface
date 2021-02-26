cmake_minimum_required(VERSION 3.19)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/extern/cmake-common")
include(CleanFlags)
include(CompilerWarnings)
include(DisableExceptions)
include(DisableRTTI)

enable_language(CXX)

project(cpp_compile_time_interface LANGUAGES CXX VERSION 0.0.1)

if("${CMAKE_SYSTEM_NAME}" STREQUAL "Darwin")
    set(CMAKE_OSX_DEPLOYMENT_TARGET "10.14" CACHE STRING "Minimum OS X deployment version" FORCE)
endif()

if(POLICY CMP0074)
    cmake_policy(SET CMP0074 NEW)
endif()

if(POLICY CMP0077)
    cmake_policy(SET CMP0077 NEW)
endif()

if(POLICY CMP0092)
    cmake_policy(SET CMP0092 NEW)
endif()

set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

if("${CMAKE_SYSTEM_NAME}" STREQUAL "Windows")
    set(CMAKE_RC_FLAGS "${CMAKE_RC_FLAGS} /nologo")
endif()

# clang and gcc don't default-print colored diagnostics when invoked from Ninja
if("${CMAKE_GENERATOR}" STREQUAL "Ninja" AND
("${CMAKE_CXX_COMPILER_ID}" MATCHES "(Apple)?[Cc]lang" OR
("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU" AND
        NOT (CMAKE_CXX_COMPILER_VERSION VERSION_LESS 4.9))))
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fdiagnostics-color")
    if("${CMAKE_SYSTEM_NAME}" STREQUAL "Windows")
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fansi-escape-codes")
    endif()
endif()

if(MSVC)
    foreach(flag_var CMAKE_CXX_FLAGS CMAKE_CXX_FLAGS_DEBUG CMAKE_CXX_FLAGS_RELEASE CMAKE_CXX_FLAGS_MINSIZEREL CMAKE_CXX_FLAGS_RELWITHDEBINFO)
        string(REPLACE "/W3" "" ${flag_var} "${${flag_var}}")
        string(REPLACE "/EHc" "" ${flag_var} "${${flag_var}}")
        string(REPLACE "/EHsc" "" ${flag_var} "${${flag_var}}")
        string(REPLACE "/GR" "" ${flag_var} "${${flag_var}}")
    endforeach()

    if("${CMAKE_CXX_COMPILER_ID}" MATCHES "(Apple)?[Cc]lang")
        set(CMAKE_INCLUDE_SYSTEM_FLAG_CXX "-imsvc ")
    else()
        set(CMAKE_INCLUDE_SYSTEM_FLAG_CXX "/external:I ")
    endif()
endif()

add_executable(${PROJECT_NAME}
    src/consumer.cpp
    src/main.cpp
    src/producer.cpp
    src/producer_a.cpp
    src/producer_b.cpp
)

target_disable_exceptions(${PROJECT_NAME})
target_disable_rtti(${PROJECT_NAME})
target_clean_flags(${PROJECT_NAME})
target_add_compiler_warnings(${PROJECT_NAME})

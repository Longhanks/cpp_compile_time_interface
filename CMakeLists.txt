cmake_minimum_required(VERSION 3.20)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/extern/cmake-common")
include(CleanFlags)
include(ColoredDiagnostics)
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

project_enable_colored_diagnostics()
project_clean_flags()

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

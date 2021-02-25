function(target_add_compiler_warnings target)
    if("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU")
        # gcc 5
        target_compile_options(${target} PRIVATE
                -Wall
                -Warray-bounds=2
                -Wcast-qual
                -Wconversion
                -Wctor-dtor-privacy
                -Wdeprecated-declarations
                -Wdisabled-optimization
                -Wdouble-promotion
                -Wextra
                -Wformat=2
                -Wlogical-op
                -Wmissing-include-dirs
                -Wnoexcept
                -Wnon-virtual-dtor
                -Wold-style-cast
                -Woverloaded-virtual
                -Wpedantic
                -Wpointer-arith
                -Wredundant-decls
                -Wshadow
                -Wsign-conversion
                -Wsized-deallocation
                -Wtrampolines
                -Wundef
                -Wunused
                -Wunused-parameter
                -Wuseless-cast
                -Wvector-operation-performance
                -Wwrite-strings
                -pedantic-errors
                )

        # gcc 6
        if(CMAKE_CXX_COMPILER_VERSION VERSION_GREATER_EQUAL 6.1)
            target_compile_options(${target} PRIVATE
                    -Wduplicated-cond
                    -Wmisleading-indentation
                    -Wnull-dereference
                    -Wshift-overflow=2
                    )
        endif()

        # gcc 7
        if(CMAKE_CXX_COMPILER_VERSION VERSION_GREATER_EQUAL 7.1)
            target_compile_options(${target} PRIVATE
                    -Wduplicated-branches
                    )
        endif()

        # gcc 9
        if(CMAKE_CXX_COMPILER_VERSION VERSION_GREATER_EQUAL 9.1)
            target_compile_options(${target} PRIVATE
                    -Wzero-as-null-pointer-constant
                    )
        endif()

        # gcc 10
        if(CMAKE_CXX_COMPILER_VERSION VERSION_GREATER_EQUAL 10.1)
            target_compile_options(${target} PRIVATE
                    -Wmismatched-tags
                    -Wredundant-tags
                    )
        endif()

    elseif("${CMAKE_CXX_COMPILER_ID}" MATCHES "(Apple)?[Cc]lang")
        target_compile_options(${target} PRIVATE
                -Weverything
                -Wno-c++98-compat
                -Wno-c++98-compat-pedantic
                -Wno-padded
                -Wno-return-std-move-in-c++11
                )
    else()
        target_compile_options(${target} PRIVATE
                /W4
                /w14242
                /w14254
                /w14263
                /w14265
                /w14287
                /we4289
                /w14296
                /w14311
                /w14545
                /w14546
                /w14547
                /w14549
                /w14555
                /w14619
                /w14640
                /w14826
                /w14905
                /w14906
                /w14928
                )
    endif()
endfunction()

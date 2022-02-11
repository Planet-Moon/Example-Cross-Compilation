set(CMAKE_BUILD_WITH_INSTALL_RPATH ON)

set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR arm)

set(CMAKE_CROSSCOMPILING ON)

set(CMAKE_GENERATOR "Ninja")

# set(TARGET_TRIPLE arm-linux-gnueabihf)

set(CMAKE_C_COMPILER "E:/GNUArmEmbeddedToolchain/gcc-arm-10.3-2021.07-mingw-w64-i686-arm-none-linux-gnueabihf/bin/arm-none-linux-gnueabihf-gcc.exe")
set(CMAKE_CXX_COMPILER "E:/GNUArmEmbeddedToolchain/gcc-arm-10.3-2021.07-mingw-w64-i686-arm-none-linux-gnueabihf/bin/arm-none-linux-gnueabihf-g++.exe")

set(ARM_CORTEX "cortex-a53")

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -mcpu=${ARM_CORTEX} -lpthread")
set(CMAKE_C_FLAGS_DEBUG "-g3 -O2 -rdynamic")
set(CMAKE_C_FLAGS_RELEASE "-g0 -O0")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -mcpu=${ARM_CORTEX} -lpthread")
set(CMAKE_CXX_FLAGS_DEBUG "-g3 -O2 -rdynamic")
set(CMAKE_CXX_FLAGS_RELEASE "-g0 -O0")

add_compile_options("-mcpu=${ARM_CORTEX}")

set(tools "E:/GNUArmEmbeddedToolchain/gcc-arm-10.3-2021.07-mingw-w64-i686-arm-none-linux-gnueabihf")

set(
    CMAKE_PREFIX_PATH
    ${tools}/arm-none-linux-gnueabihf/lib
    ${tools}/lib/gcc/arm-none-linux-gnueabihf/10.3.1
    ${tools}/arm-none-linux-gnueabihf/libc/usr/lib
    ${tools}/lib
    ${tools}/lib/gcc/arm-none-linux-gnueabihf/10.3.1/plugin
    ${tools}/libexec/gcc/arm-none-linux-gnueabihf/10.3.1
    ${tools}/arm-none-linux-gnueabihf/libc/usr/lib/audit
    ${tools}/arm-none-linux-gnueabihf/libc/usr/lib/gconv
    ${tools}/arm-none-linux-gnueabihf/lib
)

# set(
#     CMAKE_INCLUDE_PATH
#     ${CMAKE_SOURCE_DIR}/vcpkg_installed/rpi-target/include
# )

set(CMAKE_FIND_LIBRARY_PREFIXES "lib" "")

set(CMAKE_FIND_LIBRARY_SUFFIXES ".a" ".so")

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY BOTH)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE BOTH)

# set(
#     CMAKE_INCLUDE_PATH

    # ${tools}/arm-none-linux-gnueabihf/libc/usr

    # ${tools}/arm-none-linux-gnueabihf/include/c++/10.3.1

    # ${tools}/lib/gcc/arm-none-linux-gnueabihf/10.3.1/include

    # ${tools}/arm-none-linux-gnueabihf/include/c++/10.3.1

    # ${tools}/arm-none-linux-gnueabihf/include/c++/10.3.1/arm-none-linux-gnueabihf/bits

    # ${tools}/arm-none-linux-gnueabihf/include/c++/10.3.1/arm-none-linux-gnueabihf/ext

    # ${tools}/arm-none-linux-gnueabihf/include/c++/10.3.1/backward

    # ${tools}/arm-none-linux-gnueabihf/include/c++/10.3.1/bits

    # ${tools}/arm-none-linux-gnueabihf/include/c++/10.3.1/debug

    # ${tools}/arm-none-linux-gnueabihf/include/c++/10.3.1/decimal

    # ${tools}/arm-none-linux-gnueabihf/include/c++/10.3.1/experimental/bits

    # ${tools}/arm-none-linux-gnueabihf/include/c++/10.3.1/experimental

    # ${tools}/arm-none-linux-gnueabihf/include/c++/10.3.1/ext/pb_ds/detail

    # ${tools}/arm-none-linux-gnueabihf/include/c++/10.3.1/ext/pb_ds/detail/bin_search_tree_

    # ${tools}/arm-none-linux-gnueabihf/include/c++/10.3.1/ext/pb_ds/detail/binary_heap_

    # ${tools}/arm-none-linux-gnueabihf/include/c++/10.3.1/ext/pb_ds/detail/binomial_heap_

    # ${tools}/arm-none-linux-gnueabihf/include/c++/10.3.1/ext/pb_ds/detail/binomial_heap_base_

    # ${tools}/arm-none-linux-gnueabihf/include/c++/10.3.1/ext/pb_ds/detail/branch_policy

    # ${tools}/arm-none-linux-gnueabihf/include/c++/10.3.1/ext/pb_ds/detail/cc_hash_table_map_

    # ${tools}/arm-none-linux-gnueabihf/include/c++/10.3.1/ext/pb_ds/detail/eq_fn

    # ${tools}/arm-none-linux-gnueabihf/include/c++/10.3.1/ext/pb_ds/detail/gp_hash_table_map_

    # ${tools}/arm-none-linux-gnueabihf/include/c++/10.3.1/ext/pb_ds/detail/hash_fn

    # ${tools}/arm-none-linux-gnueabihf/include/c++/10.3.1/ext/pb_ds/detail/left_child_next_sibling_heap_

    # ${tools}/arm-none-linux-gnueabihf/include/c++/10.3.1/ext/pb_ds/detail/list_update_map_

    # ${tools}/arm-none-linux-gnueabihf/include/c++/10.3.1/ext/pb_ds/detail/list_update_policy

    # ${tools}/arm-none-linux-gnueabihf/include/c++/10.3.1/ext/pb_ds/detail/ov_tree_map_

    # ${tools}/arm-none-linux-gnueabihf/include/c++/10.3.1/ext/pb_ds/detail/pairing_heap_
# )

# find_library(LIBS_TEST NAMES akku REQUIRED)
# find_library(LIBS_M NAMES m REQUIRED)
find_library(LIBS_PTHREAD NAMES pthread REQUIRED)

# message(STATUS "CMAKE_LIBRARY_PATH: ${CMAKE_LIBRARY_PATH}")
# message(STATUS "CMAKE_INCLUDE_PATH: ${CMAKE_INCLUDE_PATH}")

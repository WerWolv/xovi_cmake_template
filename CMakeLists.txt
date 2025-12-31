cmake_minimum_required(VERSION 3.16)
project(XoviExtensionCMake)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_MODULE_PATH ${CMAKE_CURRENT_LIST_DIR}/cmake/modules)

include(xovi)

add_subdirectory(example)
cmake_minimum_required(VERSION 3.15)
project(mymath CXX)

add_library(mymath src/mymath.cpp)

set_target_properties(mymath PROPERTIES PUBLIC_HEADER "src/mymath.h")
install(TARGETS mymath DESTINATION "."
        PUBLIC_HEADER DESTINATION include
        RUNTIME DESTINATION bin
        ARCHIVE DESTINATION lib
        LIBRARY DESTINATION lib
        )

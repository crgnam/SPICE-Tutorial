find_package(cspice PATHS ${CMAKE_SOURCE_DIR}/cspice/lib)

# Build the batch convert objs tool:
add_executable(example example.cpp)
target_link_libraries(example PUBLIC ${CMAKE_SOURCE_DIR}/cspice/lib/cspice.a)
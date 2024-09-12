########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

set(test_COMPONENT_NAMES "")
set(test_FIND_DEPENDENCY_NAMES "")

########### VARIABLES #######################################################################
#############################################################################################
set(test_PACKAGE_FOLDER_RELEASE "/Users/jordanta/.conan/data/test/1.0/test/1.0/package/c6a7b978c36bfbdf05646cef650d3b8d3c8bea46")
set(test_BUILD_MODULES_PATHS_RELEASE )


set(test_INCLUDE_DIRS_RELEASE "${test_PACKAGE_FOLDER_RELEASE}/include")
set(test_RES_DIRS_RELEASE )
set(test_DEFINITIONS_RELEASE )
set(test_SHARED_LINK_FLAGS_RELEASE )
set(test_EXE_LINK_FLAGS_RELEASE )
set(test_OBJECTS_RELEASE )
set(test_COMPILE_DEFINITIONS_RELEASE )
set(test_COMPILE_OPTIONS_C_RELEASE )
set(test_COMPILE_OPTIONS_CXX_RELEASE )
set(test_LIB_DIRS_RELEASE "${test_PACKAGE_FOLDER_RELEASE}/lib")
set(test_LIBS_RELEASE test)
set(test_SYSTEM_LIBS_RELEASE )
set(test_FRAMEWORK_DIRS_RELEASE )
set(test_FRAMEWORKS_RELEASE )
set(test_BUILD_DIRS_RELEASE "${test_PACKAGE_FOLDER_RELEASE}/")

# COMPOUND VARIABLES
set(test_COMPILE_OPTIONS_RELEASE
    "$<$<COMPILE_LANGUAGE:CXX>:${test_COMPILE_OPTIONS_CXX_RELEASE}>"
    "$<$<COMPILE_LANGUAGE:C>:${test_COMPILE_OPTIONS_C_RELEASE}>")
set(test_LINKER_FLAGS_RELEASE
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${test_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${test_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${test_EXE_LINK_FLAGS_RELEASE}>")


set(test_COMPONENTS_RELEASE )
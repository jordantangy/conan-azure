# Avoid multiple calls to find_package to append duplicated properties to the targets
include_guard()########### VARIABLES #######################################################################
#############################################################################################
set(test_FRAMEWORKS_FOUND_RELEASE "") # Will be filled later
conan_find_apple_frameworks(test_FRAMEWORKS_FOUND_RELEASE "${test_FRAMEWORKS_RELEASE}" "${test_FRAMEWORK_DIRS_RELEASE}")

set(test_LIBRARIES_TARGETS "") # Will be filled later


######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
if(NOT TARGET test_DEPS_TARGET)
    add_library(test_DEPS_TARGET INTERFACE IMPORTED)
endif()

set_property(TARGET test_DEPS_TARGET
             PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Release>:${test_FRAMEWORKS_FOUND_RELEASE}>
             $<$<CONFIG:Release>:${test_SYSTEM_LIBS_RELEASE}>
             $<$<CONFIG:Release>:>
             APPEND)

####### Find the libraries declared in cpp_info.libs, create an IMPORTED target for each one and link the
####### test_DEPS_TARGET to all of them
conan_package_library_targets("${test_LIBS_RELEASE}"    # libraries
                              "${test_LIB_DIRS_RELEASE}" # package_libdir
                              test_DEPS_TARGET
                              test_LIBRARIES_TARGETS  # out_libraries_targets
                              "_RELEASE"
                              "test")    # package_name

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${test_BUILD_DIRS_RELEASE} ${CMAKE_MODULE_PATH})

########## GLOBAL TARGET PROPERTIES Release ########################################
    set_property(TARGET test::test
                 PROPERTY INTERFACE_LINK_LIBRARIES
                 $<$<CONFIG:Release>:${test_OBJECTS_RELEASE}>
                 $<$<CONFIG:Release>:${test_LIBRARIES_TARGETS}>
                 APPEND)

    if("${test_LIBS_RELEASE}" STREQUAL "")
        # If the package is not declaring any "cpp_info.libs" the package deps, system libs,
        # frameworks etc are not linked to the imported targets and we need to do it to the
        # global target
        set_property(TARGET test::test
                     PROPERTY INTERFACE_LINK_LIBRARIES
                     test_DEPS_TARGET
                     APPEND)
    endif()

    set_property(TARGET test::test
                 PROPERTY INTERFACE_LINK_OPTIONS
                 $<$<CONFIG:Release>:${test_LINKER_FLAGS_RELEASE}> APPEND)
    set_property(TARGET test::test
                 PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                 $<$<CONFIG:Release>:${test_INCLUDE_DIRS_RELEASE}> APPEND)
    set_property(TARGET test::test
                 PROPERTY INTERFACE_COMPILE_DEFINITIONS
                 $<$<CONFIG:Release>:${test_COMPILE_DEFINITIONS_RELEASE}> APPEND)
    set_property(TARGET test::test
                 PROPERTY INTERFACE_COMPILE_OPTIONS
                 $<$<CONFIG:Release>:${test_COMPILE_OPTIONS_RELEASE}> APPEND)

########## For the modules (FindXXX)
set(test_LIBRARIES_RELEASE test::test)

include(ExternalProject)
ExternalProject_Add(xovi
    GIT_REPOSITORY https://github.com/asivery/xovi
    GIT_TAG master
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ""
    INSTALL_COMMAND ""
)

ExternalProject_Get_Property(xovi SOURCE_DIR)
set(XOVI_REPO_PATH ${SOURCE_DIR})

# Works the same as add_executable
macro(add_xovi_extension)
    set(options )
    set(oneValueArgs XOVI_FILE NAME)
    set(multiValueArgs SOURCES)
    cmake_parse_arguments(XOVI "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})

    # Generate the XOVI extension source files
    add_custom_command(
        OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/${XOVI_NAME}_xovi.cpp ${CMAKE_CURRENT_BINARY_DIR}/${XOVI_NAME}_xovi.h
        COMMAND python3 ${XOVI_REPO_PATH}/util/xovigen.py -o ${CMAKE_CURRENT_BINARY_DIR}/${XOVI_NAME}_xovi.cpp -H ${CMAKE_CURRENT_BINARY_DIR}/xovi.h ${XOVI_XOVI_FILE}
        DEPENDS ${XOVI_FILE}
        COMMENT "Generating XOVI extension source files for ${XOVI_NAME}"
        WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}
    )

    # Add the library target
    add_library(${XOVI_NAME} MODULE
        ${XOVI_SOURCES}
        ${CMAKE_CURRENT_BINARY_DIR}/${XOVI_NAME}_xovi.cpp
    )
    add_dependencies(${XOVI_NAME} xovi)
    target_include_directories(${XOVI_NAME} PUBLIC ${CMAKE_CURRENT_BINARY_DIR})

    # Set the target properties
    set_target_properties(${XOVI_NAME} PROPERTIES
        PREFIX ""
        SUFFIX ".so"
    )
endmacro()
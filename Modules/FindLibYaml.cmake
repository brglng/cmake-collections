# LibYaml_INCLUDE_DIRS  - LibYaml include directories
# LibYaml_LIBRARIES     - LibYaml library files
# LibYaml_FOUND         - True if LibYaml found

find_path(LibYaml_INCLUDE_DIRS NAMES yaml.h ${LibYaml_ROOT})
find_library(LibYaml_LIBRARIES NAMES yaml ${LibYaml_ROOT})

# Handle the QUIETLY and REQUIRED arguments and set LibYaml_FOUND to TRUE if all listed variables are TRUE.
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(LibYaml DEFAULT_MSG LibYaml_LIBRARIES LibYaml_INCLUDE_DIRS)
mark_as_advanced(LibYaml_INCLUDE_DIRS LibYaml_LIBRARIES)

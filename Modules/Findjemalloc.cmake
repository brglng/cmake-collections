# jemalloc_INCLUDE_DIRS  - jemalloc include directories
# jemalloc_LIBRARIES     - jemalloc library files
# jemalloc_FOUND         - True if jemalloc found

find_path(jemalloc_INCLUDE_DIRS NAMES jemalloc/jemalloc.h)
find_library(jemalloc_LIBRARIES NAMES jemalloc)

# Handle the QUIETLY and REQUIRED arguments and set jemalloc_FOUND to TRUE if all listed variables are TRUE.
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(jemalloc DEFAULT_MSG jemalloc_LIBRARIES jemalloc_INCLUDE_DIRS)
mark_as_advanced(jemalloc_INCLUDE_DIRS jemalloc_LIBRARIES)

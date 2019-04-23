# RNNoise_INCLUDE_DIRS  - RNNoise include directories
# RNNoise_LIBRARIES     - RNNoise library files
# RNNoise_FOUND         - True if RNNoise found

find_path(RNNoise_INCLUDE_DIRS NAMES rnnoise.h)
find_library(RNNoise_LIBRARIES NAMES rnnoise)

# Handle the QUIETLY and REQUIRED arguments and set RNNoise_FOUND to TRUE if all listed variables are TRUE.
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(RNNoise DEFAULT_MSG RNNoise_LIBRARIES RNNoise_INCLUDE_DIRS)
mark_as_advanced(RNNoise_INCLUDE_DIRS RNNoise_LIBRARIES)

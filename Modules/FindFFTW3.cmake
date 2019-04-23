# - Find FFTW3
# Find the native FFTW3 includes and library
#
#  FFTW3_INCLUDE_DIRS   - where to find fftw3.h
#  FFTW3_LIBRARIES      - List of libraries when using FFTW3
#  FFTW3_RUNTIMES       - List of .dll files on Windows
#  FFTW3_FOUND          - True if FFTW3 found.

find_path(FFTW3_INCLUDE_DIRS NAMES fftw3.h)
find_library(FFTW3_LIBRARIES NAMES fftw3 fftw3-3 libfftw3-3)

if("${CMAKE_SYSTEM_NAME}" STREQUAL "Windows")
  find_file(FFTW3_RUNTIMES NAMES libfftw3.dll libfftw3-3.dll)
endif()

# handle the QUIETLY and REQUIRED arguments and set FFTW3_FOUND to TRUE if
# all listed variables are TRUE
include(FindPackageHandleStandardArgs)
if("${CMAKE_SYSTEM_NAME}" STREQUAL "Windows")
  find_package_handle_standard_args(FFTW3 DEFAULT_MSG FFTW3_LIBRARIES FFTW3_RUNTIMES FFTW3_INCLUDE_DIRS)
  mark_as_advanced(FFTW3_LIBRARIES FFTW3_RUNTIMES FFTW3_INCLUDE_DIRS)
else()
  find_package_handle_standard_args(FFTW3 DEFAULT_MSG FFTW3_LIBRARIES FFTW3_INCLUDE_DIRS)
  mark_as_advanced(FFTW3_LIBRARIES FFTW3_INCLUDE_DIRS)
endif()

# - Find FFTW
# Find the native FFTW includes and library
#
#  FFTW_INCLUDE_DIRS    - where to find fftw3.h
#  FFTW_LIBRARIES       - List of libraries when using FFTW
#  FFTW_RUNTIMES        - List of .dll files on Windows
#  FFTW_FOUND           - True if FFTW found.

if(FFTW_INCLUDE_DIRS)
  # Already in cache, be silent
  set(FFTW_FIND_QUIETLY TRUE)
endif(FFTW_INCLUDE_DIRS)

if("${CMAKE_SYSTEM_NAME}" STREQUAL "Windows")
  find_path(FFTW_INCLUDE_DIRS NAMES fftw3.h HINTS ${FFTW_DIR} NO_DEFAULT_PATH)
  find_library(FFTW_LIBRARIES NAMES fftw3 fftw3-3 libfftw3-3 HINTS ${FFTW_DIR} NO_DEFAULT_PATH)
  find_file(FFTW_RUNTIMES NAMES libfftw3.dll libfftw3-3.dll HINTS ${FFTW_DIR} NO_DEFAULT_PATH)
else()
  find_path(FFTW_INCLUDE_DIRS NAMES fftw3.h)
  find_library(FFTW_LIBRARIES NAMES fftw3 fftw3-3 libfftw3-3)
endif()

# handle the QUIETLY and REQUIRED arguments and set FFTW_FOUND to TRUE if
# all listed variables are TRUE
include(FindPackageHandleStandardArgs)
if("${CMAKE_SYSTEM_NAME}" STREQUAL "Windows")
  find_package_handle_standard_args(FFTW DEFAULT_MSG FFTW_LIBRARIES FFTW_RUNTIMES FFTW_INCLUDE_DIRS)
  mark_as_advanced(FFTW_LIBRARIES FFTW_RUNTIMES FFTW_INCLUDE_DIRS)
else()
  find_package_handle_standard_args(FFTW DEFAULT_MSG FFTW_LIBRARIES FFTW_INCLUDE_DIRS)
  mark_as_advanced(FFTW_LIBRARIES FFTW_INCLUDE_DIRS)
endif()

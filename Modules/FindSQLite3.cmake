# SQLite3_INCLUDE_DIRS  - sqlite3 include directories
# SQLite3_SOURCES       - sqlite3 source files (Windows only)
# SQLite3_LIBRARIES     - sqlite3 library files
# SQLite3_FOUND         - True if sqlite found

if("${CMAKE_SYSTEM_NAME}" STREQUAL "Windows")
  find_path(SQLite3_INCLUDE_DIRS NAMES sqlite3.h HINTS ${SQLite3_DIR})
  find_file(SQLite3_SOURCES NAMES sqlite3.c HINTS ${SQLite3_DIR})
else()
  find_path(SQLite3_INCLUDE_DIRS NAMES sqlite3.h)
  find_library(SQLite3_LIBRARIES NAMES sqlite3)
endif()

# Handle the QUIETLY and REQUIRED arguments and set SQLITE3_FOUND to TRUE if all listed variables are TRUE.
include(FindPackageHandleStandardArgs)
if("${CMAKE_SYSTEM_NAME}" STREQUAL "Windows")
  find_package_handle_standard_args(SQLite3 DEFAULT_MSG SQLite3_SOURCES SQLite3_INCLUDE_DIRS)
  mark_as_advanced(SQLite3_INCLUDE_DIRS SQLite3_LIBRARIES)
else()
  find_package_handle_standard_args(SQLite3 DEFAULT_MSG SQLite3_LIBRARIES SQLite3_INCLUDE_DIRS)
  mark_as_advanced(SQLite3_INCLUDE_DIRS SQLite3_LIBRARIES)
endif()

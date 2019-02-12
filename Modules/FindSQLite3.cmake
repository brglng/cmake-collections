# SQLite3_INCLUDE_DIRS  - sqlite3 include directories
# SQLite3_LIBRARIES     - sqlite3 library files
# SQLite3_FOUND         - True if sqlite found

find_path(SQLite3_INCLUDE_DIRS NAMES sqlite3.h ${SQLite3_ROOT})
find_library(SQLite3_LIBRARIES NAMES sqlite3 ${SQLite3_ROOT})

# Handle the QUIETLY and REQUIRED arguments and set SQLITE3_FOUND to TRUE if all listed variables are TRUE.
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(SQLite3 DEFAULT_MSG SQLite3_LIBRARIES SQLite3_INCLUDE_DIRS)
mark_as_advanced(SQLite3_INCLUDE_DIRS SQLite3_LIBRARIES)

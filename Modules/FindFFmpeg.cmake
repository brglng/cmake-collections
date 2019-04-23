find_package(PkgConfig QUIET)

foreach(comp ${FFmpeg_FIND_COMPONENTS})
  if (NOT ("${comp}" MATCHES "^(avcodec|avformat|avutil|avfilter|avdevice|swresample|swscale)$"))
    message(FATAL_ERROR "${comp} is not a FFmpeg component name")
  endif()

  pkg_check_modules(PkgConfig_${comp} lib${comp} QUIET)

  set(FFmpeg_${comp}_FOUND ${PkgConfig_${comp}_FOUND})
  set(FFmpeg_${comp}_INCLUDE_DIRS ${PkgConfig_${comp}_INCLUDE_DIRS})
  list(APPEND FFmpeg_INCLUDE_DIRS ${PkgConfig_${comp}_INCLUDE_DIRS})
endforeach()

foreach(comp ${FFmpeg_FIND_COMPONENTS})
  foreach(lib ${PkgConfig_${comp}_LIBRARIES})
    find_library(FFmpeg_${comp}_${lib}_LIBRARIES ${lib})
    list(APPEND FFmpeg_${comp}_LIBRARIES ${FFmpeg_${comp}_${lib}_LIBRARIES})
  endforeach()
  list(APPEND FFmpeg_LIBRARIES ${FFmpeg_${comp}_LIBRARIES})
endforeach()

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(FFmpeg REQUIRED_VARS FFmpeg_LIBRARIES FFmpeg_INCLUDE_DIRS HANDLE_COMPONENTS)

mark_as_advanced(
  FFmpeg_INCLUDE_DIRS
  FFmpeg_avformat_INCLUDE_DIRS
  FFmpeg_avcodec_INCLUDE_DIRS
  FFmpeg_avutil_INCLUDE_DIRS
  FFmpeg_swscale_INCLUDE_DIRS
  FFmpeg_avdevice_INCLUDE_DIRS
  FFmpeg_avfilter_INCLUDE_DIRS
  FFmpeg_swresample_INCLUDE_DIRS
  FFmpeg_LIBRARIES
  FFmpeg_avformat_LIBRARIES
  FFmpeg_avcodec_LIBRARRIES
  FFmpeg_avutil_LIBRARIES
  FFmpeg_swscale_LIBRARIES
  FFmpeg_avdevice_LIBRARIES
  FFmpeg_avfilter_LIBRARIES
  FFmpeg_avresample_LIBRARIES)

# Set package properties if FeatureSummary was included
if(COMMAND set_package_properties)
  set_package_properties(FFmpeg PROPERTIES DESCRIPTION "A complete, cross-platform solution to record, convert and stream audio and video")
  set_package_properties(FFmpeg PROPERTIES URL "http://ffmpeg.org/")
endif()

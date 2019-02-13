foreach(comp ${FFmpeg_FIND_COMPONENTS})
  if (NOT ("${comp}" MATCHES "^(avformat|avutil|avcodec|swscale|avdevice|avfilter|swresample)$"))
    message(FATAL_ERROR "${comp} is not a FFmpeg component name")
  endif()

  find_path(FFmpeg_${comp}_INCLUDE_DIRS lib${comp}/${comp}.h ${FFmpeg_ROOT})

  if(NOT (${FFmpeg_${comp}_INCLUDE_DIRS} STREQUAL ""))
    list(APPEND FFmpeg_INCLUDE_DIRS ${FFmpeg_${comp}_INCLUDE_DIRS})
  endif()

  find_library(FFmpeg_${comp}_LIBRARIES ${comp} ${FFmpeg_ROOT})

  if(NOT ((${FFmpeg_${comp}_INCLUDE_DIRS} STREQUAL "") OR (${FFmpeg_${comp}_LIBRARIES} STREQUAL "")))
    set(FFmpeg_${comp}_FOUND True)
    list(APPEND FFmpeg_LIBRARIES ${FFmpeg_${comp}_LIBRARIES})
  endif()
endforeach()

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(FFmpeg REQUIRED_VARS FFmpeg_LIBRARIES FFmpeg_INCLUDE_DIRS
                                         HANDLE_COMPONENTS)

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

foreach(comp ${FFmpeg_FIND_COMPONENTS})
  if (NOT ("${comp}" MATCHES "^(avformat|avutil|avcodec|swscale|avdevice|avfilter|swresample)$"))
    message(FATAL_ERROR "${comp} is not a FFmpeg component name")
  endif()
  find_path(
    FFmpeg_${comp}_INCLUDE_DIR
    lib${comp}/${comp}.h
    $ENV{FFMPEG_DIR}
    $ENV{FFMPEG_DIR}/ffmpeg
    $ENV{FFMPEG_DIR}/lib${comp}
    $ENV{FFMPEG_DIR}/include/lib${comp}
    $ENV{FFMPEG_DIR}/include/ffmpeg
    /usr/local/include/ffmpeg
    /usr/include/ffmpeg
    /usr/include/lib${comp}
    /usr/include/ffmpeg/lib${comp}
    /usr/include/${CMAKE_LIBRARY_ARCHITECTURE}/lib${comp}
    /usr/local/include/lib${comp}
    /usr/local/ffmpeg/include)

  if(NOT ("${FFmpeg_${comp}_INCLUDE_DIR}" STREQUAL ""))
    list(APPEND FFmpeg_INCLUDE_DIRS ${FFmpeg_${comp}_INCLUDE_DIR})
  endif()

  find_library(
    FFmpeg_${comp}_LIBRARY
    ${comp}
    $ENV{FFMPEG_DIR}
    $ENV{FFMPEG_DIR}/lib
    $ENV{FFMPEG_DIR}/lib${comp}
    /usr/local/lib
    /usr/lib
    /usr/local/ffmpeg/lib)

  if(NOT (("${FFmpeg_${comp}_INCLUDE_DIR}" STREQUAL "") OR ("${FFmpeg_${comp}_LIBRARY}" STREQUAL "")))
    set(FFmpeg_${comp}_FOUND True)
    list(APPEND FFmpeg_LIBRARIES ${FFmpeg_${comp}_LIBRARY})
  endif()
endforeach()

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(FFmpeg REQUIRED_VARS FFmpeg_LIBRARIES FFmpeg_INCLUDE_DIRS
                                         HANDLE_COMPONENTS)

mark_as_advanced(
  FFmpeg_INCLUDE_DIRS
  FFmpeg_avformat_INCLUDE_DIR
  FFmpeg_avcodec_INCLUDE_DIR
  FFmpeg_avutil_INCLUDE_DIR
  FFmpeg_swscale_INCLUDE_DIR
  FFmpeg_avdevice_INCLUDE_DIR
  FFmpeg_avfilter_INCLUDE_DIR
  FFmpeg_swresample_INCLUDE_DIR
  FFmpeg_LIBRARIES
  FFmpeg_avformat_LIBRARY
  FFmpeg_avcodec_LIBRARY
  FFmpeg_avutil_LIBRARY
  FFmpeg_swscale_LIBRARY
  FFmpeg_avdevice_LIBRARY
  FFmpeg_avfilter_LIBRARY
  FFmpeg_avresample_LIBRARY)

# Set package properties if FeatureSummary was included
if(COMMAND set_package_properties)
  set_package_properties(FFmpeg PROPERTIES DESCRIPTION "A complete, cross-platform solution to record, convert and stream audio and video")
  set_package_properties(FFmpeg PROPERTIES URL "http://ffmpeg.org/")
endif()

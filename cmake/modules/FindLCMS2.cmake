#
# Find the native LCMS includes and library
#

# This module defines
# LCMS_INCLUDE_DIR, where to find art*.h etc
# LCMS_LIBRARY, the libraries
# LCMS_FOUND, If false, do not try to use LCMS.
# LIBLCMS_LIBS, link information
# LIBLCMS_CFLAGS, cflags for include information


# INCLUDE(UsePkgConfig)

# use pkg-config to get the directories and then use these values
# in the FIND_PATH() and FIND_LIBRARY() calls
# PKGCONFIG(lcms _lcmsIncDir _lcmsLinkDir _lcmsLinkFlags _lcmsCflags)

# SET(LCMS2_LIBS ${_lcmsCflags})

FIND_PATH(LCMS2_INCLUDE_DIR lcms2.h
  /usr/include
  /usr/local/include
  PATH_SUFFIXES lcms2
)

FIND_LIBRARY(LCMS2_LIBRARY_RELEASE
  NAMES ${LCMS2_NAMES_RELEASE} ${LCMS2_NAMES} lcms2 liblcms2 lcms2dll
  PATHS /usr/lib /usr/local/lib
)

FIND_LIBRARY(LCMS2_LIBRARY_DEBUG
  NAMES ${LCMS2_NAMES_DEBUG} lcms2d liblcms2d lcms2dlld
  PATHS /usr/lib /usr/local/lib
)

INCLUDE(LibraryDebugAndRelease)
SET_LIBRARY_FROM_DEBUG_AND_RELEASE(LCMS2)

MESSAGE("LCMS 2 ReleaseLibrary: ${LCMS2_LIBRARY_RELEASE}")
MESSAGE("LCMS 2 Debug Library: ${LCMS2_LIBRARY_DEBUG}")
MESSAGE("LCMS 2 Library: ${LCMS2_LIBRARY}")

IF (LCMS2_LIBRARY AND LCMS2_INCLUDE_DIR)
  SET( LCMS2_FOUND 1 )
  SET( LCMS_LIBRARIES ${LCMS2_LIBRARY} )
ELSE (LCMS2_LIBRARY AND LCMS2_INCLUDE_DIR)
  SET( LCMS2_FOUND 0 )
ENDIF (LCMS2_LIBRARY AND LCMS2_INCLUDE_DIR)

SET(LCMS2_FIND_QUIETLY 1)

IF (LCMS2_FOUND)
  IF (NOT LCMS2_FIND_QUIETLY)
	MESSAGE(STATUS "Found LittleCMS 2: ${LCMS2_LIBRARY}")
  ENDIF (NOT LCMS2_FIND_QUIETLY)
ELSE (LCMS2_FOUND)
  IF (LCMS2_FIND_REQUIRED)
    MESSAGE(FATAL_ERROR "Could not find LittleCMS")
  ENDIF (LCMS2_FIND_REQUIRED)
ENDIF (LCMS2_FOUND)

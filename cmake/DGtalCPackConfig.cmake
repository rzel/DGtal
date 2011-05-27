
SET(CPACK_PACKAGE_VERSION_MAJOR 	 ${DGtal_VERSION_MAJOR})
SET(CPACK_PACKAGE_VERSION_MINOR 	 ${DGtal_VERSION_MINOR})
SET(CPACK_PACKAGE_VERSION_PATCH 	 ${DGtal_VERSION_PATCH})
# for other generator set specific backend information
INCLUDE(InstallRequiredSystemLibraries)

SET(CPACK_PACKAGE_DESCRIPTION_SUMMARY "DGtal Project")
SET(CPACK_PACKAGE_VENDOR ".")
SET(CPACK_PACKAGE_DESCRIPTION_FILE "${CMAKE_CURRENT_SOURCE_DIR}/README")
SET(CPACK_RESOURCE_FILE_LICENSE "${CMAKE_CURRENT_SOURCE_DIR}/LICENSE")
SET(CPACK_PACKAGE_CONTACT "dgtal@liris.cnrs.fr" )
SET(CPACK_NSIS_CONTACT "dgtal@liris.cnrs.fr")

IF(WIN32 AND NOT UNIX)
  SET(CPACK_NSIS_DISPLAY_NAME "${CPACK_PACKAGE_INSTALL_DIRECTORY} DGtal")
  SET(CPACK_NSIS_HELP_LINK "http:\\\\\\\\liris.cnrs.fr/dgtal")
  SET(CPACK_NSIS_URL_INFO_ABOUT "http:\\\\\\\\liris.cnrs.fr/dgtal")
  SET(CPACK_NSIS_MODIFY_PATH ON)
ELSE(WIN32 AND NOT UNIX)
  ##SET(CPACK_STRIP_FILES "bin/main") ??
  SET(CPACK_SOURCE_STRIP_FILES "")
ENDIF(WIN32 AND NOT UNIX)

SET(CPACK_SOURCE_IGNORE_FILES CVS;[.]svn;[.]git;[.]AppleDouble;[.]\#.*;\#.*;.*[.]kdev4;.*~;build.*;doc/html/*;doc/latex/*;doc/html-Board/*)

if(WIN32)
  SET(CPACK_GENERATOR "NSIS;")
else(WIN32)
  SET(CPACK_GENERATOR "TGZ;DEB")
endif(WIN32)

INCLUDE(CPack)
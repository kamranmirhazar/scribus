include_directories(
	${CMAKE_SOURCE_DIR}
	${CMAKE_SOURCE_DIR}/scribus
)

set(SHAPE_PLUGIN_MOC_CLASSES
	shapepalette.h
	shapeplugin.h
)

set(SHAPE_PLUGIN_SOURCES
	shapepalette.cpp
	shapeplugin.cpp
)

set(SCRIBUS_SHAPE_PLUGIN "shapeplugin")

QT5_WRAP_CPP(SHAPE_PLUGIN_MOC_SOURCES ${SHAPE_PLUGIN_MOC_CLASSES})

add_library(${SCRIBUS_SHAPE_PLUGIN} MODULE
	${SHAPE_PLUGIN_SOURCES}
	${SHAPE_PLUGIN_MOC_SOURCES}
)

target_link_libraries(${SCRIBUS_SHAPE_PLUGIN} ${PLUGIN_LIBRARIES})

install(TARGETS ${SCRIBUS_SHAPE_PLUGIN}
	LIBRARY
	DESTINATION ${PLUGINDIR}
	PERMISSIONS ${PLUGIN_PERMISSIONS}
)

add_dependencies(${SCRIBUS_SHAPE_PLUGIN} ${EXE_NAME})


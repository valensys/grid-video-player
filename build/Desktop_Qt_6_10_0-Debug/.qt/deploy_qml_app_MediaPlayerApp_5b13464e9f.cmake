include("/home/vlv/Qt/Examples/Qt-6.10.0/demos/mediaplayer/build/Desktop_Qt_6_10_0-Debug/.qt/QtDeploySupport.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/MediaPlayerApp-plugins.cmake" OPTIONAL)
set(__QT_DEPLOY_I18N_CATALOGS "qtbase;qtdeclarative;qtdeclarative;qtdeclarative;qtdeclarative;qtdeclarative;qtdeclarative;qtdeclarative;qtdeclarative;qtdeclarative;qtmultimedia")

qt6_deploy_qml_imports(TARGET MediaPlayerApp PLUGINS_FOUND plugins_found)
qt6_deploy_runtime_dependencies(
    EXECUTABLE "/home/vlv/Qt/Examples/Qt-6.10.0/demos/mediaplayer/build/Desktop_Qt_6_10_0-Debug/MediaPlayerApp"
    ADDITIONAL_MODULES ${plugins_found}
    GENERATE_QT_CONF
)
cmake_minimum_required(VERSION 3.16)

project(IOT_QT_QML VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick)

qt_standard_project_setup()

qt_add_executable(appIOT_QT_QML
    main.cpp
)

qt_add_qml_module(appIOT_QT_QML
    URI IOT_QT_QML
    VERSION 1.0
    QML_FILES Main.qml
              SwitchButton.qml
              CircleProgress.qml
    RESOURCES android/AndroidManifest.xml
    RESOURCES assets/Bluetooth.png
              assets/IOT.png
              assets/light.png
              assets/null.png
              assets/wifi.png

)

# 设置图标和名字
set_property(TARGET appIOT_QT_QML APPEND PROPERTY QT_ANDROID_PACKAGE_SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/android)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appIOT_QT_QML PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appIOT_QT_QML
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appIOT_QT_QML
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appIOT_QT_QML
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

QT += quick
QT += quickwidgets
CONFIG += c++11
android {
QMAKE_LFLAGS += -nostdlib++
}

DEFINES += QT_DEPRECATED_WARNINGS

SOURCES += \
        circle.cpp \
        main.cpp \
        stopwatch.cpp

RESOURCES += qml.qrc \
    Resources/Icons.qrc

QML_IMPORT_PATH =

QML_DESIGNER_IMPORT_PATH =

qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

DISTFILES += \
    android/AndroidManifest.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew \
    android/gradlew.bat \
    android/res/values/libs.xml

HEADERS += \
    circle.h \
    stopwatch.h

contains(ANDROID_TARGET_ARCH,x86) {
    ANDROID_PACKAGE_SOURCE_DIR = \
        $$PWD/android
}

QT += quick

CONFIG += c++11
android {
QMAKE_LFLAGS += -nostdlib++
}

DEFINES += QT_DEPRECATED_WARNINGS

SOURCES += \
        main.cpp \
        stopwatch.cpp

RESOURCES += qml.qrc \
    Resources/Icons.qrc

QML_IMPORT_PATH =

QML_DESIGNER_IMPORT_PATH =

qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

DISTFILES +=

HEADERS += \
    stopwatch.h

# Additional import path used to resolve QML modules in Creator's code model
QML_IMPORT_PATH =

# The .cpp file which was generated for your project. Feel free to hack it.
QT += core sql serialport
SOURCES += main.cpp \
    sensorthread.cpp \
    gprsthread.cpp \
    rfidthread.cpp \
    login.cpp \
    rfiddatabase.cpp \
    database.cpp

RESOURCES += qml.qrc

# Installation path
# target.path =

# Please do not modify the following two lines. Required for deployment.
include(qtquick1applicationviewer/qtquick1applicationviewer.pri)

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    sensorthread.h \
    gprsthread.h \
    rfidthread.h \
    login.h \
    rfiddatabase.h \
    database.h

FORMS += \
    rfiddatabase.ui

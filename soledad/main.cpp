#include "qtquick1applicationviewer.h"
#include <QApplication>
#include <QDeclarativeContext>
#include <sensorthread.h>
#include <gprsthread.h>
#include <rfidthread.h>
#include <login.h>
#include <rfiddatabase.h>
int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QtQuick1ApplicationViewer viewer;
    /*
     *    Expose C++ classes and functions to QML
     */
    sensorthread *sensor = new sensorthread();
    viewer.rootContext()->setContextProperty("ssr",sensor);
    gprsthread *gprs = new gprsthread();
    viewer.rootContext()->setContextProperty("gprs",gprs);
    rfidThread *rfid = new rfidThread();
    viewer.rootContext()->setContextProperty("rfid",rfid);
    login *logi = new login();
    viewer.rootContext()->setContextProperty("loginClass",logi);
    RfidDataBase *rfidData = new RfidDataBase();
    viewer.rootContext()->setContextProperty("rfidData",rfidData);
//    sensor->start();
//    gprs->start();
//    rfid->start();
//    if(sensor->isRunning())
//        sensor->stop();
//    if(gprs->isRunning())
//        gprs->stop();
//    if(rfid->isRunning())
//        rfid->stop();
//    sensor->wait();
//    gprs->wait();
//    rfid->wait();
    /*
     *    Expose C++ classes and functions to QML  END
     */
    viewer.addImportPath(QLatin1String("modules"));
    viewer.setOrientation(QtQuick1ApplicationViewer::ScreenOrientationAuto);
    viewer.setMainQmlFile(QLatin1String("qrc:///main.qml"));
    viewer.showExpanded();

    return app.exec();
}

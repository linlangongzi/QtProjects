#ifndef SENSORTHREAD_H
#define SENSORTHREAD_H
#include <QThread>
#include <QDebug>
#include <QString>
#include <QtSerialPort/QSerialPort>
//#include <serial/posix_qextserialport.h>
class sensorthread : public QThread
{
        Q_OBJECT
        Q_PROPERTY(QString temperature READ getTemperature WRITE setTemperature NOTIFY temperatureChanged)
        Q_PROPERTY(QString wet READ getWet WRITE setWet NOTIFY wetChanged)
        Q_PROPERTY(bool smoke READ getSmoke WRITE setSmoke NOTIFY smokeChanged)
        Q_PROPERTY(bool people READ getPeople WRITE setPeople NOTIFY peopleChanged)
        Q_PROPERTY(bool lightState READ getLightState WRITE setLightState NOTIFY lightStateChanged)
        //
        Q_PROPERTY(bool window READ getWindow WRITE setWindow NOTIFY windowChanged)
        Q_PROPERTY(bool computer READ getComputer WRITE setComputer NOTIFY computerChanged)
        Q_PROPERTY(bool door READ getDoor WRITE setDoor NOTIFY doorChanged)
        Q_PROPERTY(bool power READ getPower WRITE setPower NOTIFY powerChanged)
        Q_PROPERTY(bool projector READ getProjector WRITE setProjector NOTIFY projectorChanged)
        Q_PROPERTY(bool airCondition READ getAirCondition WRITE setAirCondition NOTIFY airConditionChanged)
    public:
        explicit sensorthread(QObject *parent = 0);
        void stop();
        char buffer[46]; //   Each frame contains 46 bytes data
        char buff_set[46]={0xEE,0xCC,0x01,0x00,0x00,0x00,0x00,0x00  //8
                          ,0x01,0x00,0x00,0x25,0x86,0x50,0x49,0x28,0x04,0x00,0x4B,0x12 //20
                          ,0x00,0x00,0x00,0x79,0x72,0x00,0x00,0x00,0x00,0x02,0x01,0x00,0x72,0x02 // 34
                          ,0x0F,0x01,0x01,0x00,0x00,0x00,0x00,0x00,0x00 //43
                          ,0x00,0x00,0xFF};
        //get temperature
        Q_INVOKABLE QString getTemperature();
        void setTemperature(QString temp);
        //get wet
        Q_INVOKABLE QString getWet();
        void setWet(QString wet);
        //get smoke
        Q_INVOKABLE bool getSmoke();
        void setSmoke(bool smk);
        //get people
        Q_INVOKABLE bool getPeople();
        void setPeople(bool ple);
        //get light
        Q_INVOKABLE bool getLightState();
        void setLightState(bool light);
        // windows
        Q_INVOKABLE bool getWindow();
        void setWindow(bool wind);
        //computer
        Q_INVOKABLE bool getComputer();
        void setComputer(bool comp);
        //door
        Q_INVOKABLE bool getDoor();
        void setDoor( bool dr);
        //power
        Q_INVOKABLE bool getPower();
        void setPower (bool p);
        //projector
        Q_INVOKABLE bool getProjector();
        void setProjector(bool pro);
        //airCondition
        Q_INVOKABLE bool getAirCondition();
        void setAirCondition(bool  air);

    signals:
        void temperatureChanged();
        void wetChanged();
        void smokeChanged();
        void peopleChanged();
        void lightStateChanged();
        //
        void windowChanged();
        void computerChanged();
        void doorChanged();
        void powerChanged();
        void projectorChanged();
        void airConditionChanged();
    public slots:

    protected:
        void run();
    private:
        QSerialPort *sensorcom;
        bool stopflag;
        QString m_temp;
        QString m_wet;
        bool m_smoke;
        bool m_ple;
        bool m_lightState;
        //
        bool m_window;
        bool m_computer;
        bool m_door;
        bool m_power;
        bool m_pro;
        bool m_air;
};

#endif // SENSORTHREAD_H

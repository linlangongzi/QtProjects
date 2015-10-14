#ifndef GPRSTHREAD_H
#define GPRSTHREAD_H
#include <QThread>
#include <QtSerialPort/QtSerialPort>
//#include <serial/posix_qextserialport.h>
class gprsthread : public QThread
{
    Q_OBJECT
public:
    explicit gprsthread(QObject *parent=0);
    Q_INVOKABLE void gainMessage(QString phoneNumber);
    void stop();
    void gprs_call(char *number, int num);
    void gprs_hold();
    void SendMSG(QString number, QString mssage);
    void messageProcess(char* phoneNumb, char* msgContent);
protected:
    void run();  

private :
        volatile  bool stopflag;
        QString m_num;
        QString m_msg;
        QSerialPort *gprscom;
        void gprs_init();
        void gprs_read_message(int index);
signals:
        void signalGprsData(char *,char *);
        void messageChanged();
};

#endif // GPRSTHREAD_H

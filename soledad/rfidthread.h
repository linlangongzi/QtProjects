#ifndef rfidTHREAD_H
#define rfidTHREAD_H
#include<math.h>
#include <QThread>
#include <QtSerialPort/QSerialPort>
class rfidThread : public QThread
{
    Q_OBJECT
    Q_PROPERTY(QString rfidCard READ getRfidCard WRITE setRfidCard NOTIFY rfidCardChanged)
public:
    explicit rfidThread(QObject *parent = 0);
    void stop();
    Q_INVOKABLE QString getRfidCard();
    void setRfidCard(QString cardId);
//    QString rfidCardId(QString cardId);
    char rfiddata[14];
signals:
    void rfidCardChanged(QString card);

protected:
    void run();

private:
    QSerialPort *rfidcom;
    QString m_cardId;
    bool stopflag;
    
};

#endif // rfidTHREAD_H

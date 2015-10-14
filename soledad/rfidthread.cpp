#include <rfidthread.h>
#include <QDebug>
rfidThread::rfidThread(QObject *parent) :
    QThread(parent)
{
    rfidcom = new QSerialPort(this);
    rfidcom->setPortName("com7");
    //set attribute of serial
    rfidcom->setBaudRate(QSerialPort::Baud115200);
    rfidcom->setDataBits(QSerialPort::Data8);
    rfidcom->setParity(QSerialPort::NoParity);
    rfidcom->setStopBits(QSerialPort::OneStop);
    rfidcom->setFlowControl(QSerialPort::NoFlowControl);
    rfidcom->open(QIODevice::ReadWrite);//open
    memset(rfiddata,0,sizeof(rfiddata));
    m_cardId.clear();
    stopflag=false;
   // start();
}
QString rfidThread::getRfidCard()
{
    return m_cardId;
}
void rfidThread::setRfidCard(QString cardId)
{
//    if(cardId != m_cardId)
//    {
        m_cardId = cardId;
        qDebug()<<"Card ID  is >>"<<m_cardId;
        emit rfidCardChanged(m_cardId);
//    }
}

void rfidThread::run()
{
    QString rfidflow;
    while (!stopflag)
    {
        QByteArray rfidArray = rfidcom->readAll();
        qDebug()<<"ka de shuju"<<rfidArray[0];
        if(((rfidArray[0] & 0xFF) == 0xEE)
                && ((rfidArray[1] & 0xFF) == 0xCC)
                &&((rfidArray[2] & 0xFF) == 0xFE)
                && ((rfidArray[13] & 0xFF) == 0xFF)
                )
        {
            rfidflow = rfidArray.toHex().data();
            rfidflow = rfidflow.mid(5,4);
            qDebug()<<"ka de dedededede"<<rfidflow;
            setRfidCard(rfidflow);
        }
        else
        {
            rfidflow = "No card";
            setRfidCard(rfidflow);
        }
        msleep(100);
    }
    stopflag=false;
}
void rfidThread::stop() {  stopflag=true; }

//QString rfidThread::rfidCardId(QString cardId)
//{
//    int n;
//    if(cardId[13]==(char)0xFF)
//    {
//        qDebug("Card serial number is: %2x\n",cardId[3]);
//        if(cardId[3]==(char)0x01)
//        {
//            n=((int)cardId[5])*pow(2,24)+((int)cardId[6])*pow(2,16)+((int)cardId[7])*pow(2,8)+(int)cardId[8];
//            qDebug()<<"Card Id is"<<n;
//            return n;
//        }
//        else
//        {
//            qDebug()<<"Nothing";
//            return 0;
//        }
//    }
//}

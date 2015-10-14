#include "sensorthread.h"
/*************************************************************/
/*                            Initial Com attributes                               */
/*************************************************************/
sensorthread::sensorthread(QObject *parent) :
    QThread(parent)
{
    stopflag=false;
    sensorcom = new QSerialPort(this);
    sensorcom->setPortName("com7");
    sensorcom->open(QIODevice::ReadWrite);//open
    //set attribute of serial
    sensorcom->setBaudRate(QSerialPort::Baud115200);
    sensorcom->setDataBits(QSerialPort::Data8);
    sensorcom->setParity(QSerialPort::NoParity);
    sensorcom->setStopBits(QSerialPort::OneStop);
    sensorcom->setFlowControl(QSerialPort::NoFlowControl);
    m_ple = false;
    m_smoke = false;
   // m_lightState = false;
    //   start  thread once sensorthreadthread is called
    start();
}
void sensorthread::stop()
{
    stopflag=true;
}
/************************************************************************/
/*                            Read & Process data from serial                               */
/***********************************************************************/
void sensorthread::run()
{
  //  int size = -1;
  //  memset(buffer,0,sizeof(buffer));
    //
    int size = -1;
//    while(!stopflag)
//    {
//        QByteArray temp = sensorcom->readAll();
//        qDebug()<<"temp is"<<temp[0];
//        msleep(1000);
//        if(!temp.isEmpty())
//        {
//            if(temp.length() > 46)
//            {
//                temp.clear();
//                qDebug()<<"~~~~~~~~~~"<<temp[2]<<endl;
//            }
//            //
//            qDebug()<<"@@@@@@"<<temp[3]<<endl;
//            if(/*temp.length() == 46
//                    && */((quint8)temp[0] & 0xFF) == 0xee
//                    && ((quint8)temp[1] & 0xFF) == 0xcc
//                    &&  ((quint8)temp[45] & 0xFF) == 0xFF)
//        size = sensorcom->read(buffer,1);
//        msleep(100);
//        if(size>=0 && buffer[0] ==(char)0xEE)
//        {
//             size = sensorcom->read(buffer+1,25);
//             if(size>=0 && buffer[1] == (char)0xCC
//                     && buffer[45] ==(char) 0xFF)
//            {
//                qDebug()<<"#####"<<buffer[5]<<endl;
//                switch( (quint8)buffer[34] )
//                {
//                    case 0x0A:
//                       {
//                            qDebug()<<"~~ccccc~~~"<<buffer<<endl;
//                            double tem=( (quint8)buffer[36] *256+ (quint8)buffer[37] )/10;
//                            double humi=( (quint8)buffer[38] *256+ (quint8)buffer[39] )/10;
//                            double tem = (((quint8)temp[7]<<8)+(quint8)temp[8])/10.0;
//                            double humi = (((quint8)temp[5]<<8)+(quint8)temp[6])/10.0;
//                         //   QString wd=QString::number(tem);
//                            QString sd=QString::number(humi);
//                        //    QString wendu;
//                        //    setTemperature(wendu.setNum(tem));
//                            setTemperature(tem);
//                            qDebug()<<"tem is ~~~~~~~~~~~"<<tem<<endl;
//                            setWet(sd);
//                            break;
//                        }
//                    case 0x0B:
//                    {
//                        if(buffer[42]==(unsigned char)0x01)
//                        {
//                              qDebug()<<"There exists Smoke";
//                              setSmoke(true);
//                         }
//                        else
//                        {
//                              qDebug()<<"No Smoke";
//                              setSmoke(false);
//                         }
//                        break;
//                    }
//                    case (unsigned char)0x07:
//                    {
//                        if(buffer[42]==(unsigned char)0x01)
//                        {
//                              qDebug()<<"Some People here";
//                              setPeople(true);
//                         }
//                        else
//                        {
//                               qDebug()<<"No People here";
//                               setPeople(false);
//                         }
//                        break;
//                    }
//                    case (unsigned char)0x0F:
//                    {
//                        if(buffer[42]==(unsigned char)0x01)
//                        {
//                              qDebug()<<"Turn on Switch";
//                              m_lightState = true;
//                              getLightState();
//                         }
//                        else
//                        {
//                              qDebug()<<"Turn off Switch";
//                              m_lightState = false;
//                              getLightState();
//                         }
//                        break;
//                    }
//                    case (unsigned char)0x03:
//                    {
//                        if(buffer[42]==(unsigned char)0x01)
//                        {
//                              qDebug()<<"Red Ray Link is Down";
//                              //Whatever Function it adds here
//                              // For example:
//                              m_door = true;
//                              getDoor();
//                         }
//                        else
//                        {
//                              qDebug()<<"Red Ray Link is Up";
//                              //Whatever Function it adds here
//                              // For example:
//                              m_door = false;
//                              getDoor();
//                         }
//                        break;
//                    }
//               }
//            }
//        }
//    }
    //
    while(!stopflag)
    {
       size = sensorcom->read(buffer,1);
       msleep(1000);
       if(size>0 && buffer[0] ==(char)0xEE)
       {
            size = sensorcom->read(buffer+1,45);        // //read data from COM
            if(size>0 && (buffer[1] == (char)0xCC) && (buffer[45] ==(char) 0xFF))
            {
//                 for(int i = 0;i<46;i++)
//                 {
//                    qDebug("buffer[%d]=%02x",   i,(unsigned char)buffer[i]);
//                 }
//                   Analysis of data and process with specific functions
//                   from here
                 switch(buffer[34])
                 {
                     case (unsigned char)0x0A:
                        {
                             double tem=((unsigned char)buffer[41]*256+(unsigned char)buffer[42])/10;
                             double humi=((unsigned char)buffer[39]*256+(unsigned char)buffer[40])/10;
                             qDebug()<<"temperature"<<tem;
                             QString wd=QString::number(tem);
                             QString sd=QString::number(humi);
                             setTemperature(wd);
                             setWet(sd);
                             break;
                         }
                     case (unsigned char)0x0B:
                         if(buffer[42]==(unsigned char)0x01)
                         {
                               qDebug()<<"There exists Smoke";
                               setSmoke(true);
                          }
                         else
                         {
                               qDebug()<<"No Smoke";
                               setSmoke(false);
                          }
                         break;
                     case (unsigned char)0x07:
                         if(buffer[42]==(unsigned char)0x01)
                         {
                               qDebug()<<"Some People here";
                               setPeople(true);
                          }
                         else
                         {
                                qDebug()<<"No People here";
                                setPeople(false);
                          }
                         break;

                     case (unsigned char)0x0F:
                         if(buffer[42]==(unsigned char)0x01)
                         {
                               qDebug()<<"on Switch"<<buffer[42];

                          }
                         else
                         {
                               qDebug()<<"Turn off Switch"<<buffer[42];
                          }
                         break;

                     case (unsigned char)0x03:
                         if(buffer[42]==(unsigned char)0x01)
                         {
                               qDebug()<<"Red Ray Link is Down";
                               //Whatever Function it adds here
                               // For example:
                              // setDoor(true);
                          }
                         else
                         {
                               qDebug()<<"Red Ray Link is Up";
                               //Whatever Function it adds here
                               // For example:
                               //setDoor(false);
                         }
                         break;
                }
            }
        }
    }
    stopflag=false;
}
/*************************************************************/
/*                        Temperature  Functions                                */
/*************************************************************/
QString sensorthread::getTemperature()
{
    qDebug()<<"GET:  temperature is "<<m_temp<<endl;
    return m_temp;
}
void sensorthread::setTemperature(QString temp)
{
//    if(temp != m_temp)
//    {
        m_temp = temp;
        qDebug()<<"SET:  now temperature is"<<m_temp<<endl;
        emit temperatureChanged();
//    }
}
/************************************************************/
/*                               Wet  Functions                                     */
/************************************************************/
QString sensorthread::getWet()
{
    qDebug()<<"GET:    Wet  is  "<<m_wet;
    return m_wet;
}
void sensorthread::setWet(QString wet)
{
//    if(wet != m_wet)
//    {
        m_wet = wet;
        qDebug()<<"SET :  Now wet is"<<m_wet<<endl;
        emit wetChanged();
//    }
}
/********************************************************/
/*                              Smoke functions                             */
/********************************************************/
bool sensorthread::getSmoke()
{
    qDebug()<<"GET:  Smoke is" << m_smoke;
    return m_smoke;
}
void sensorthread:: setSmoke(bool smk)
{
//    if(smk != m_smoke)
//    {
        m_smoke = smk;
        qDebug()<<"SET:  Now Smoke status is"<<m_smoke;
        emit smokeChanged();
//    }
}
/************************************************************/
/*                               People Test Functions                          */
/************************************************************/
bool sensorthread::getPeople()
{
    qDebug()<<"GET : People  Exists"<<m_ple;
    return m_ple;
}
void sensorthread::setPeople(bool ple)
{
//    if(ple != m_ple)
//    {
        m_ple = ple;
        qDebug()<<"SET: People Exists"<<m_ple;
        emit peopleChanged();
//    }
}
/************************************************************/
/*                               Light  Functions                                */
/************************************************************/
bool sensorthread::getLightState() { return m_lightState; }
void sensorthread::setLightState (bool light)
{
//    if(light !=  m_lightState)
//    {
        int i;
        m_lightState = light;
        if(m_lightState == true)
        {
            buff_set[42]=0x01;
            sensorcom->write(buff_set,sizeof(buff_set));
            //test data
            for(int i = 0;i<46;i++)
            {
               qDebug("~~~buffer_seton[%d]=%02x",   i,(unsigned char)buff_set[i]);
            }
        }
        else
        {
            buff_set[42]=0x00;
            sensorcom->write(buff_set,sizeof(buff_set));
            for(int i = 0;i<46;i++)
            {
               qDebug("buffer_set[%d]=%02x",   i,(unsigned char)buff_set[i]);
            }
        }
        qDebug()<<"SET: lightState is"<<buff_set[42];
      //  emit lightStateChanged();
//    }
}
/************************************************************/
/*                               Window  Functions                                */
/************************************************************/
bool sensorthread::getWindow() { return m_window; }
void sensorthread::setWindow(bool wind)
{
//    if(wind != m_window)
//    {
        m_window = wind;
        qDebug()<<"SET: window state is"<<m_window<<endl;
        emit windowChanged();
//    }
}
/************************************************************/
/*                               Computer  Functions                            */
/************************************************************/
bool sensorthread::getComputer() { return m_computer;}
void sensorthread::setComputer(bool comp)
{
//    if(comp != m_computer)
//    {
        m_computer = comp;
        qDebug()<<"SET: computer state is"<<m_computer<<endl;
        emit computerChanged();
//    }
}
/************************************************************/
/*                                  Door  Functions                                 */
/************************************************************/
bool sensorthread::getDoor() { return m_door; }
void sensorthread::setDoor(bool dr)
{
//    if(dr != m_door)
//    {
        m_door = dr;
//        if(m_door == true)
//        {
//            buff_set[34]=0x03;
//            buff_set[42]=0x01;
//            sensorcom->write(buff_set,sizeof(buff_set));
//        }
//        else
//        {
//            buff_set[34]=0x03;
//            buff_set[42]=0x00;
//            sensorcom->write(buff_set,sizeof(buff_set));
//        }
        qDebug()<<"SET: door state is"<<m_door<<endl;
        emit doorChanged();
//    }
}
/************************************************************/
/*                                  Power  Functions                               */
/************************************************************/
bool sensorthread::getPower() { return m_power; }
void sensorthread::setPower(bool p)
{
//    if(p!=m_power)
//    {
        m_power = p;
        qDebug()<<"SET:  power state is "<<m_power;
        emit powerChanged();
//    }
}
/************************************************************/
/*                               Projector  Functions                            */
/************************************************************/
bool sensorthread::getProjector() { return m_pro; }
void sensorthread::setProjector(bool pro)
{
//    if(pro!= m_pro)
//    {
        m_pro = pro;
        qDebug()<<"SET:  projector state is"<<m_pro;
        emit powerChanged();
//    }
}
/************************************************************/
/*                                       Air  Functions                               */
/************************************************************/
bool sensorthread::getAirCondition() { return m_air; }
void sensorthread::setAirCondition(bool air)
{
//    if(air != m_air)
//    {
        m_air = air;
        qDebug()<<"SET:   air state is"<<m_air;
        emit airConditionChanged();
//    }
}

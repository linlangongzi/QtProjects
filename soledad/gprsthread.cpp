#include "gprsthread.h"
#include "QDebug"
//#include "QSqlQuery"
//#include "database.h"
#include "QVariant"
gprsthread::gprsthread(QObject *parent):QThread(parent)
{
    gprscom = new QSerialPort(this);
    gprscom->setPortName("com7");
    gprscom->open(QIODevice::ReadWrite);//open
    //set attribute of serial
    gprscom->setBaudRate(QSerialPort::Baud115200);
    gprscom->setDataBits(QSerialPort::Data8);
    gprscom->setParity(QSerialPort::NoParity);
    gprscom->setStopBits(QSerialPort::OneStop);
    gprscom->setFlowControl(QSerialPort::NoFlowControl);
    m_msg.clear();
    m_num.clear();
    gprs_init();
    start();
}
void gprsthread::stop()
{
    stopflag=true;
}
/********************************************************/
/*                               Gain Message                                */
/********************************************************/
void gprsthread::gainMessage(QString phoneNumber)
{
    if(phoneNumber != NULL)
    {
        qDebug()<<"PHone NUMBER is"<<phoneNumber;
        SendMSG(phoneNumber,"Temperature is 24, Wet is 34");
    }
    else
    {
        qDebug()<<"PhoneNumber format is wrong";
    }
}

void gprsthread::gprs_call(char *number, int num)
{
    qDebug("start call");
    char revbuffer[20];
    gprscom->write("atd", strlen("atd"));
    gprscom->write(number, num);
    gprscom->write(";\r", strlen(";\r"));
    int ret;
    for(;;)
    {
         ret = gprscom->read(revbuffer,20);
        if(ret > 0)
        {
                break;
        }
    }
    if(strstr(revbuffer,"NO ANSWER") != 0)
    {
        printf("error\n");
        return ;
    }
    if(strstr(revbuffer,"NO CARRIER") != 0)
    {
        printf("error\n");
        return ;
    }
    if(strstr(revbuffer,"BUSY") != 0)
    {
        printf("error\n");
        return ;
    }
    if(strstr(revbuffer,"+COLP") != 0)
    {
        printf("connect ok\n");
        gprscom->read(revbuffer,20);
        if(strstr(revbuffer,"OK") == 0)
        {
            printf("error\n");
        }
    }
    qDebug("call end");
        //usleep(200000);
}
void gprsthread::gprs_read_message(int index)
{
    char Cmd_Buffer[13]="at+cmgr=";
    char buffer[3]={'\0'};
    gcvt((double)index, 2, buffer);
    strcat(Cmd_Buffer,buffer);
    strcat(Cmd_Buffer,"\r");
    printf("sending----",Cmd_Buffer);
    gprscom->write(Cmd_Buffer, strlen(Cmd_Buffer));
}

void gprsthread::gprs_hold()
{
        qDebug("start hold");
        char revbuffer[20];
        gprscom->write("at\r", strlen("at\r"));
        gprscom->read(revbuffer,20);
        if(strstr(revbuffer,"OK") == 0 )
            printf("error\n");
        gprscom->write("ath\r", strlen("ath\r"));
        gprscom->read(revbuffer,20);
        if(strstr(revbuffer,"OK") == 0 )
            printf("error\n");
}

void gprsthread::SendMSG(QString number, QString mssage)
{
    char ctl[]={26,0}; //ctl[0]=26,ctrl+z
    if(gprscom != NULL)
    {
        qDebug()<<"Send Message Wonderfully~"<<number;
        gprscom->write("at+cmgs=",strlen("at+cmgs="));   //Send Message
        gprscom->write("\"",1);
        gprscom->write(number.toStdString().c_str(),number.size());
        gprscom->write("\"",1);
        gprscom->write(";\r",2);
        gprscom->write(mssage.toStdString().c_str(),mssage.size());
        gprscom->write(ctl,1);
        qDebug()<<"Send Message hehehe~";
    }
    fflush(STDIN_FILENO);
}
void gprsthread::run()
{
    QString datatosend;
    char c;
    char tmp[5];
    char msgindex_c[4];
    int msgindex_i;
    char telenum[16];
    char msgtime[23];
    char msgcontent[200];
    int i;
    while(1)
    {
       gprscom->read(&c,1);
        qDebug()<<"c="<<c;
        if(c=='+')
        {
            gprscom->read(tmp,4);
            tmp[4]='\0';
            qDebug()<<"tmp="<<tmp;
            if(strcmp(tmp,"CMTI")==0)//+CMTI:"SM",1   //Recieve message
            {
                gprscom->read(&c,1);
                while(c!=',')
                {
                    qDebug()<<"c="<<c;
                    gprscom->read(&c,1);
                }
                gprscom->read(msgindex_c,2);
                msgindex_c[2]='\0';
                qDebug()<<"messageindexccc="<<msgindex_c;
                msgindex_i=atoi(msgindex_c);
                qDebug()<<"messageindexiiii="<<msgindex_i;
                gprs_read_message(msgindex_i);
                msleep(100);
            }
            else if(strcmp(tmp,"CMGR")==0)
            {
                gprscom->read(&c,1);
                qDebug()<<c;
                if(c=='=')
                    continue;
                while(c!=',')
                {
                    qDebug()<<",,c="<<c;
                    printf(",,c=%c\n",c);
                    gprscom->read(&c,1);
                }
                gprscom->read(&c,1);
                printf("000c=%c\n",c);
                gprscom->read(&c,1);
                i=0;
                while(c!='\"')
                {
                    printf("111c=%c\n",c);
                    telenum[i++]=c;
                    gprscom->read(&c,1);
                }
                telenum[i]='\0';
                gprscom->read(&c,1);
                gprscom->read(&c,1);
                gprscom->read(&c,1);
                gprscom->read(&c,1);
                gprscom->read(&c,1);
                gprscom->read(&c,1);
                i=0;
                while(c!='\"')
                {
                    printf("222c=%c  i=%d\n",c,i);
                    msgtime[i++]=c;
                    gprscom->read(&c,1);
                }
                msgtime[i]='\0';
                qDebug()<<"msgtime="<<msgtime;
                gprscom->read(&c,1);
                gprscom->read(&c,1);
                i=0;
                gprscom->read(&c,1);
                while(c!='\n')
                {
                    printf("444c=%c\n",c);
                    msgcontent[i++]=c;
                    gprscom->read(&c,1);
                }
                msgcontent[i]='\0';
                qDebug()<<"msgcontent="<<msgcontent;
                qDebug()<<"number="<<telenum;
                datatosend.clear();
                datatosend.append(telenum);
                datatosend.append("#");
                datatosend.append(msgcontent);
                qDebug()<<"datatosend="<<datatosend;
                emit signalGprsData(telenum,msgcontent);
                messageProcess(telenum,msgcontent);
               // fflush(STDIN_FILENO);
            }
        }
        msleep(800);
    }
    stopflag=false;
}
void gprsthread::messageProcess(char* phoneNumb, char* msgContent)
{
    qDebug()<<"Message from"<<phoneNumb;
    if(strcmp(msgContent,"11*env\r")==0)
    {
        qDebug()<<"success";
        SendMSG("15542695265","csn,28,55");
    }
    if(strcmp(msgContent,"10*light*on\r")==0)
    {
        char str1[]={0xEE,0xCC,0x00,0x00,0x00,0x79,0x6F,0x00,0x00,
                     0x00,0x00,0x01,0x0B,0x0A,0x0F,0x01,0x01,0x00,0x00,0x00,0x00,0x00,0x01,0x00,0x00,0xFF};
        gprscom->write(str1,sizeof(str1));
    }
    if(strcmp(msgContent,"10*light*off\r")==0)
    {
        char str[]={0xEE,0xCC,0x00,0x00,0x00,0x79,0x6F,0x00,0x00,
                     0x00,0x00,0x01,0x0B,0x0A,0x0F,0x01,0x01,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xFF};
        gprscom->write(str,sizeof(str));
    }
}
void gprsthread::gprs_init()
{
    //gprs初始化
    qDebug()<<"init gprs start";
    gprscom->write("at\r", strlen("at\r"));//测试GPRS模块状态
    usleep(1000);
    gprscom->write("ate0\r", strlen("ate0\r"));//guanbi命令回显功能
    usleep(1000);
    gprscom->write("at+clvl=100\r", strlen("at+clvl=100\r"));	//设置输出音频信号增益：100，最大音量
    usleep(1000);
    gprscom->write("at+cmgf=1\r", strlen("at+cmgf=1\r")); // Short message format
    usleep(1000);
    gprscom->write("at+clip=1\r", strlen("at+clip=1\r"));
    usleep(1000);
    gprscom->write("at+cscs=\"GSM\"\r", strlen("at+cscs=\"GSM\"\r"));  //surport net
    usleep(1000);
    gprscom->write("at+clip=1\r", strlen("at+clip=1\r"));//打开来电显示
    usleep(1000);
    gprscom->write("at+cnmi=2,1,0,0,0\r", strlen("at+cnmi=2,1,0,0,0\r"));
    usleep(1000);
    qDebug()<<"init gprs over";
}

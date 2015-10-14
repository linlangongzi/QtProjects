#include <login.h>
login::login(QObject *parent):QObject(parent)
{
    m_username.isEmpty();
    m_password.isEmpty();
}
/********************************************************/
/*                                 Log In Function                            */
/********************************************************/
QString login::getUserName() {  qDebug()<<m_username;  return m_username; }

void login::setUserName(QString userName)
{
    if(userName != m_username)
    {
        m_username = userName;
        emit userNameChanged();
    }
    qDebug()<<"m_username"<<m_username;
}

QString login::getPassWord(){ qDebug()<<"m_password is"<<m_password;  return m_password; }

void login::setPassWord(QString psWord)
{
    if(psWord != m_password)
    {
        m_password = psWord;
        emit passWordChanged();
    }
    qDebug()<<"Enter set password and PassWord is"<<m_password;
}
bool login::log_In()
{
    QString admin ="admin";
    QString pd = "12345";
    if(m_username == admin && m_password == pd)
    {
        qDebug()<<"Enter Login Successfully!    ";
        return true;
    }
    else
    {
        return false;
    }
}

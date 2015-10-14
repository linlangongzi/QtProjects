#ifndef LOGIN_H
#define LOGIN_H
#include <QObject>
#include<QDebug>
class login: public QObject
{
        Q_OBJECT
        //This is for LogIn
        Q_PROPERTY(QString userName READ getUserName WRITE setUserName NOTIFY userNameChanged)
        Q_PROPERTY(QString passWord READ getPassWord WRITE setPassWord NOTIFY passWordChanged)
    public:
        login(QObject *parent = 0);
        //Log In
        QString getUserName();
        void setUserName(QString userName);
        QString getPassWord();
        void setPassWord(QString psWord);
         Q_INVOKABLE bool log_In();
    private:
        QString m_username;
        QString m_password;
    signals:
        void userNameChanged();
        void passWordChanged();
};

#endif // LOGIN_H

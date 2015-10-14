#ifndef DATABASE_H
#define DATABASE_H
#include <QtSql/QSqlDatabase>
#include <QDebug>
#include <QMessageBox>
#include <QtSql/QSqlQuery>
#include <QtSql/QSqlError>
class database
{
public:
    database();
    void createTables();
    bool createConnection(QString dbname);
    void closeDatabase();
private:
    QSqlDatabase db;

};

#endif // DATABASE_H

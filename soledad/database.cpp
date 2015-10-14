#include "database.h"
database::database()
{

}
bool database::createConnection(QString dbname)
{
    QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName(dbname);
    if(!db.open())
    {

        QMessageBox::critical(NULL,"Can't open Database","Unable to connect to Database",QMessageBox::Cancel);
        return false;

    }
    qDebug("Create Connection ");
    return true;

}

void database::createTables()
{
    QSqlQuery query;
    qDebug() << "Create tables";
    query.exec("create table cardInfor(Card Id Integer Primary key,Name varchar(12),Car Id varchar(20),Location varchar(20))");
}

void database::closeDatabase()
{
    db.close();
}

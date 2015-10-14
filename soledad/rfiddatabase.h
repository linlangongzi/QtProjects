#ifndef RFIDDATABASE_H
#define RFIDDATABASE_H
#include <database.h>
#include <QMainWindow>
#include <QtSql/QSqlQuery>
#include <QtSql/QSqlTableModel>
#include <QMouseEvent>
#include <QPoint>
namespace Ui {
class RfidDataBase;
}

class RfidDataBase : public QMainWindow
{
        Q_OBJECT

    public:
        explicit RfidDataBase(QWidget *parent = 0);
        ~RfidDataBase();
        void initTableView();
        void mousePressEvent(QMouseEvent *event);
        void mouseMoveEvent(QMouseEvent *event);
    private slots:
        void on_Add_clicked();

        void on_Delete_clicked();

        void on_Commit_clicked();

        void on_Cancel_clicked();

        void on_ShowAll_clicked();

        void on_Back_clicked();

        void on_Search_clicked();

    private:
        QPoint pos;
        Ui::RfidDataBase *ui;
        QSqlTableModel *model;
};

#endif // RFIDDATABASE_H

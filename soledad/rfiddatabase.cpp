#include "rfiddatabase.h"
#include "ui_rfiddatabase.h"
RfidDataBase::RfidDataBase(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::RfidDataBase)
{
    ui->setupUi(this);
    this->setWindowFlags(Qt::FramelessWindowHint);
    this->setWindowOpacity(0.8);
    database dbtest;
    if(!dbtest.createConnection("cardInfor.db"))
    {
        qDebug()<<"Can't link to Database"<<endl;
        close();
    }
    dbtest.createTables();
    dbtest.closeDatabase();
    initTableView();
}
void RfidDataBase::initTableView()
{
    model = new QSqlTableModel(this);
    model->setTable("cardInfor");
    model->setEditStrategy(QSqlTableModel::OnManualSubmit);
    model->select();
    ui->tableView->setModel(model);
}
RfidDataBase::~RfidDataBase()
{
    delete ui;
}

void RfidDataBase::on_Add_clicked()
{
    int rowNum = model->rowCount();
    model->insertRow(rowNum);
    model->setData(model->index(rowNum,1),"Please input datas");
}

void RfidDataBase::on_Delete_clicked()
{
    int curRow = ui->tableView->currentIndex().row();
    model->removeRow(curRow);
    int ok = QMessageBox::warning(this,"Delete Curretn row","Sure to delete current row?",QMessageBox::Yes,QMessageBox::No);
    if(ok == QMessageBox::No)
    {
        model->revertAll();
    }
    else
    {
        model->submitAll();
    }
}

void RfidDataBase::on_Commit_clicked()
{
    model->database().transaction();
    if(model->submitAll())
    {
        model->database().commit();
    }
    else
    {
        model->database().rollback();
        QString str;
        str = "Errors occur in database:";
        str += model->lastError().text();
        QMessageBox::warning(this,"tableModel",str);
    }
}

void RfidDataBase::on_Cancel_clicked()
{
        model->revertAll();
}

void RfidDataBase::on_ShowAll_clicked()
{
    model->setTable("cardInfor");
    model->select();
}

void RfidDataBase::on_Back_clicked()
{
    this->close();
}

void RfidDataBase::on_Search_clicked()
{
        QString name = ui->searchframe->text();
        QString sql = "";
        sql += "Card Id likes'%"+name+"%'";
        qDebug()<<sql;
        model->setFilter(sql);
        model->select();
}
void RfidDataBase::mousePressEvent(QMouseEvent *event)
{
    if (event->button() == Qt::LeftButton)
    {
         pos = event->globalPos() - frameGeometry().topLeft();
         event->accept();
    }
}

void RfidDataBase::mouseMoveEvent(QMouseEvent *event)
{
     if (event->buttons() & Qt::LeftButton)
     {
        move(event->globalPos() - pos);
        event->accept();
     }
}

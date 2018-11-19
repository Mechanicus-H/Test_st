#include "widget.h"

Widget::Widget(QWidget *parent)
    : QWidget(parent)
{
    openDB("airports_db"); // база по умолчанию

    resize(900,600);

    tree=new QTreeWidget();
    table=new QTableView();

    input=new QLineEdit;
    but=new QPushButton("Go");



    connect(tree, SIGNAL(itemClicked(QTreeWidgetItem*,int)),
            this , SLOT(slotBuildTable(QTreeWidgetItem*)));
    connect(input, SIGNAL(returnPressed()),
            this, SLOT(slotExecute()));
    connect(but, SIGNAL(clicked()),
            this, SLOT(slotExecute()));



    QStringList treeHeaderList;
    treeHeaderList << "City/Airport" << "City_ID";

    tree->setHeaderLabels(treeHeaderList);
    tree->setSortingEnabled(true);


    QHBoxLayout *box=new QHBoxLayout;
    box->addWidget(tree,1.5);

    QVBoxLayout *vBox=new QVBoxLayout;
    vBox->addWidget(table);
    vBox->addWidget(input);
    vBox->addWidget(but);

    box->addLayout(vBox,3);

    buildTree();

    setLayout(box);
}

Widget::~Widget()
{

}
//-----------------------------------------------
bool Widget::openDB(const QString& dbName)
{
    QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE"); // SQLITE
    db.setDatabaseName(dbName);
    db.setUserName("root");
    db.setHostName("localhost");
    db.setPassword("password");

    if(!db.open())
    {
        qDebug() << "Can't open database: " <<db.lastError();
        return false;
    }

    qDebug() << "Database opened";
    return true;
}
//-----------------------------------------------
void Widget::buildTree(const QString &table1, const QString &table2)
{
    tree->clear();

    QSqlQuery query;
    QString str;
    tree->header()->setSectionResizeMode(QHeaderView::ResizeToContents);

    str="SELECT * FROM " + table1 + ";";

    if(!query.exec(str))
    {
        qDebug() << "Error";
    }

    QSqlRecord rec= query.record();

    while(query.next()) // сначала читаем базу городов
    {
        QTreeWidgetItem *newItem=new QTreeWidgetItem(tree);

        int city_id=query.value(rec.indexOf("city_id")).toInt();

        newItem->setText(
                    0,
                    query.value(rec.indexOf("name")).toString()
                );

        newItem->setText(
                    1,
                    QString::number(city_id)
                    );
        //---------------------------------------------------------------------
        str="SELECT * FROM " + table2 + " WHERE city_id=" + QString::number(city_id);
        QSqlQuery secQuery;

        if(!secQuery.exec(str))
        {
            qDebug() << "Error 02";
        }

        QSqlRecord secRec=secQuery.record();

        while(secQuery.next()) // потом для каждого города считываем соответсвующие аэропорты
        {
            QTreeWidgetItem *newItem2=new QTreeWidgetItem(newItem);

            int airport_id=secQuery.value(secRec.indexOf("airport_id")).toInt();

            newItem2->setText(
                        0,
                        secQuery.value(secRec.indexOf("name")).toString()
                    );
        }


    }
}
//-----------------------------------------------
void Widget::buildTable()
{
    /*
     * Все работает через фильтры, а не через QSqlQueryModel,
     * так как нам нужно иметь возможность менять значения прямо в таблице.
     * */

    QTreeWidgetItem *item=widgetToExecute;

    if(item->columnCount()>2 || item->columnCount()<1)
        return;

    QSqlTableModel *model=new QSqlTableModel;

    if(item->columnCount()==2)
    {

        model->setTable("airports");
        model->select();
        model->setEditStrategy(QSqlTableModel::OnFieldChange);

        QString filter=item->text(1);

        model->setFilter("city_id="+filter);
        table->setModel(model);
    }
    else
    {
        model->setTable("plains");
        model->select();
        model->setEditStrategy(QSqlTableModel::OnFieldChange);

        QString filter=item->text(0);

//        qDebug() << "Filter " << filter;

        model->setFilter("airport_id= (SELECT DISTINCT airport_id from airports where name = '" + filter+"')");
        table->setModel(model);
    }
}
//-----------------------------------------------
// Slots
void Widget::slotBuildTable(QTreeWidgetItem *item)
{
    /*
     * Весь этот слот сделан только для того что бы
     * задержка между отображениями была от 1 до 5 секунд,
     * вычисляемая как псевдо-случайное число.
     */

    widgetToExecute=item;
    int random=(qrand()%5)+1;

    qDebug() << "Random: " << random;

    QTimer::singleShot(random*1000,        // по заданию, надо что бы симулировалась задержка подключения к базе,
                       this,               // и выполнялась она в другом потоке - singleShot() как раз и выполняется
                       SLOT(slotBuild())); // не в основном потоке.
}
//-----------------------------------------------
void Widget::slotBuild()
{
    buildTable();
}
//-----------------------------------------------
void Widget::slotExecute()
{
    if(input->text()=="") return;
    inputString=input->text();

    QSqlQuery q;

    if(q.exec(inputString))
    {
        input->setText("Query: OK");
    }
    buildTable();
    buildTree();
}
//-----------------------------------------------

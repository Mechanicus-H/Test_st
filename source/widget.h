#ifndef WIDGET_H
#define WIDGET_H

#include <QWidget>
#include <QtWidgets>
#include <QtSql>

class Widget : public QWidget
{
    Q_OBJECT
private:
    QTreeWidget *tree; // левое окошко
    QTableView *table; // Правое окошко
    QTreeWidgetItem *widgetToExecute; // item из левого окна по которому построится таблица
    QLineEdit *input; // строка для ввода текстовых команд
    QPushButton *but; // кнопка для применения текстовых команд
    QString inputString; // для хранения запроса в базу
public:
    Widget(QWidget *parent = 0);
    ~Widget();
    bool openDB(const QString& dbName); // открыть соединение
    void buildTree(const QString& table1="cities", const QString& table2="airports"); // построить дерево
    void buildTable(); // строить таблицу
public slots:
    void slotBuildTable(QTreeWidgetItem *item); // для получения итема и сохранения его в переменной и дальнейшиз вызовов
    void slotBuild(); // строим таблицу
    void slotExecute(); // выполняем запрос. !!!Падает при неправильном запросе
signals:
    void signalBuild(QTreeWidgetItem*, int); // для соединения всего что должно быть соединено
};

#endif // WIDGET_H

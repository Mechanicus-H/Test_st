#include "widget.h"
#include <QApplication>

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    a.addLibraryPath(QString("./plugins/"));
    Widget w;
    w.show();

    return a.exec();
}

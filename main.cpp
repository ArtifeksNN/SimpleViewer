#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include <ViewerManager.h>
#include <ComponentData.h>

using namespace ComponentInfo;

int main(int argc, char *argv[])
{
    ViewerManager *viewerManager = new ViewerManager();

    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    engine.rootContext()->setContextProperty("_viewerManager", viewerManager);
    qmlRegisterUncreatableType<ComponentInfo::ComponentData>("ComponentData", 1, 0, "ComponentData", "Data for Viewer");

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}

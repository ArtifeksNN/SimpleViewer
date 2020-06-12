#pragma once

#include <QObject>

#include "ComponentListModel.h"

namespace ComponentInfo
{
class ViewerManager : public QObject
{
    Q_OBJECT

    Q_PROPERTY(ComponentListModel *componentModel READ componentModel NOTIFY componentModelChanged)
    Q_PROPERTY(int objectsCount READ objectsCount NOTIFY objectsCountChanged)

public:
    explicit ViewerManager(QObject *parent = nullptr);
    ComponentListModel *componentModel() const;

    Q_INVOKABLE void addComponent(int type);
    Q_INVOKABLE void switchType(int index);

    int objectsCount() const;

signals:
    void componentModelChanged();
    void objectsCountChanged();

public slots:

private:
    ComponentListModel *m_componentModel;
};
}

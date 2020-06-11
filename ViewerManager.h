#pragma once

#include <QObject>

#include "ComponentListModel.h"

namespace ComponentInfo
{
class ViewerManager : public QObject
{
    Q_OBJECT

    Q_PROPERTY(ComponentListModel *componentModel READ componentModel NOTIFY componentModelChanged)

public:
    explicit ViewerManager(QObject *parent = nullptr);
    ComponentListModel *componentModel() const;

    Q_INVOKABLE void addComponent(int type);

signals:
    void componentModelChanged();

public slots:

private:
    ComponentListModel *m_componentModel;
};
}

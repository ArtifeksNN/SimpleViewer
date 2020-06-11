#include <QDebug>

#include "ComponentListModel.h"
#include "ComponentData.h"

using namespace ComponentInfo;

ComponentListModel::ComponentListModel(QObject *parent) :
    QAbstractListModel(parent)
{
}

int ComponentListModel::rowCount(const QModelIndex &parent) const
{
    if (parent.isValid())
    {
        return 0;
    }

    return m_componentList.size();
}

QVariant ComponentListModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid())
    {
        return QVariant();
    }

    const Component& component = m_componentList[index.row()];
    switch (role) {
    case TypeRole:
        return component.m_type;
    case ColorRole:
        return component.m_color;
    default:
        return QVariant();
    }
}

QHash<int, QByteArray> ComponentListModel::roleNames() const
{
    QHash<int, QByteArray> roles = QAbstractListModel::roleNames();
    roles[TypeRole] = "itemType";
    roles[ColorRole] = "itemColor";

    return roles;
}

void ComponentListModel::addComponent(int type)
{
    beginInsertRows(QModelIndex(), m_componentList.size(), m_componentList.size());
    switch (type) {
    case ComponentData::Circle:
        m_componentList.append({ComponentData::Circle, "#FFF500"});
        break;
    case ComponentData::Triangle:
        m_componentList.append({ComponentData::Triangle, "#24FF00"});
        break;
    case ComponentData::Square:
        m_componentList.append({ComponentData::Square, "#0057FF"});
        break;
    default:
        break;
    }
    endInsertRows();
}

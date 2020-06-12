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
        m_componentList.append({type, "#24FF00"});
        break;
    case ComponentData::Square:
        m_componentList.append({type, "#FE0000"});
        break;
    default:
        break;
    }
    endInsertRows();
}

void ComponentListModel::switchType(int index)
{
    emit layoutAboutToBeChanged();
    const auto& type = m_componentList.at(index).m_type;
    switch (type) {
    case ComponentData::Circle:
        m_componentList[index].m_type = ComponentData::Square;
        break;
    case ComponentData::Square:
        m_componentList[index].m_type = ComponentData::Circle;
        break;
    default:
        break;
    }
    emit layoutChanged();
}

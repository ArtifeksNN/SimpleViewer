#include "ViewerManager.h"
#include "ComponentData.h"

using namespace ComponentInfo;

ViewerManager::ViewerManager(QObject *parent) :
    QObject(parent),
    m_componentModel(new ComponentListModel(this))
{
}

ComponentListModel *ViewerManager::componentModel() const
{
    return m_componentModel;
}

void ViewerManager::addComponent(int type)
{
    m_componentModel->addComponent(type);
    emit objectsCountChanged();
}

void ViewerManager::switchType(int index)
{
    m_componentModel->switchType(index);
}

int ViewerManager::objectsCount() const
{
    return m_componentModel->rowCount(QModelIndex());
}

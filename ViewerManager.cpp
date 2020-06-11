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
}

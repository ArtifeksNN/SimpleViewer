#pragma once

#include <QObject>
#include <QAbstractListModel>

namespace ComponentInfo
{
struct Component
{
    int m_type;
    QString m_color;
};

class ComponentListModel : public QAbstractListModel
{
    Q_OBJECT
public:
    enum Roles {
        TypeRole = Qt::UserRole + 1,
        ColorRole
    };

    explicit ComponentListModel(QObject *parent = nullptr);

    int rowCount(const QModelIndex &parent) const override;
    QVariant data(const QModelIndex &index, int role) const override;
    QHash<int, QByteArray> roleNames() const override;

    void addComponent(int type);
private:
    QList<Component> m_componentList;
};
}

#pragma once

#include <QObject>

namespace ComponentInfo
{
class ComponentData
{
    Q_GADGET
    Q_ENUMS(ComponentType)

public:
    enum ComponentType
    {
        Square = 0,
        Circle
    };
};
}

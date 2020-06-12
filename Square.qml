import QtQuick 2.14

CoreItem {
    id: root

    property alias itemColor: visuals.color

    VisualSquare {
        id: visuals

        anchors.fill: parent
        highlightedState: isHighlighted
    }
}

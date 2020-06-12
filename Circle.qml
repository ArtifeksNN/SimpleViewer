import QtQuick 2.14

CoreItem {
    id: root

    VisualCircle {
        anchors.fill: parent
        highlightedState: isHighlighted
    }
}

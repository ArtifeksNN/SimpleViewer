import QtQuick 2.14

CoreItem {
    id: root

    VisualSquare {
        anchors.fill: parent
        highlightedState: isHighlighted
    }
}

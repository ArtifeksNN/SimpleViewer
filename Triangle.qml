import QtQuick 2.14

CoreItem {
    id: root

    VisualTriangle {
        anchors.fill: parent
        highlightedState: isHighlighted
    }
}

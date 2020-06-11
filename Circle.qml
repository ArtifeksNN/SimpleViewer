import QtQuick 2.14

CoreItem {
    id: root

    Rectangle {
        width: 150
        height: 150
        color: "#FFF500"

        border.color: isHighlighted ? "##FFF500" : "#000000"
        border.width: isHighlighted ? 5 : 0
        radius: width * 0.5
    }
}

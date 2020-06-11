import QtQuick 2.14

CoreItem {
    id: root

    Rectangle {
        width: 150
        height: 150
        color: "#FE0000"
        antialiasing: true

        border.color: isHighlighted ? "#0057FF" : "#000000"
        border.width: isHighlighted ? 5 : 0
    }
}

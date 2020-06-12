import QtQuick 2.14

Rectangle {
    id: root

    property bool highlightedState: false

    color: "#FFF500"
    antialiasing: true

    border.color: highlightedState ? "#0057FF" : "#000000"
    border.width: highlightedState ? 5 : 0
    radius: width * 0.5
}

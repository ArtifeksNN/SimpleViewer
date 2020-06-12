import QtQuick 2.14

Rectangle {
    id: root

    property bool highlightedState: false

    color: "#FE0000"
    antialiasing: true

    border.color: highlightedState ? "#0057FF" : "#000000"
    border.width: highlightedState ? 5 : 0
}

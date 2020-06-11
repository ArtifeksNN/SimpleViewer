import QtQuick 2.0

Item {
    id: root

    width: 200

    Rectangle {
        anchors.fill: parent
        color:"white"
        border.color: "black"
        border.width: 1
    }

//    ListView {
//        id: componentList

//        anchors.fill: parent
//        spacing: 1
//        model: _viewerManager.componentModel
//        highlightRangeMode: ListView.StrictlyEnforceRange

//        delegate: Rectangle {
//            id: delegate
//            height: 80
//            width: 200
//            color: highlight ? "green" : "grey"

//            Text {
//                anchors.centerIn: parent
//                text: name
//                font.pixelSize: 22
//            }

//            MouseArea {
//                anchors.fill: parent
//                onClicked: {
//                    _viewerManager.setHighlight(index, !highlight)
//                }
//            }
//        }
//    }
}

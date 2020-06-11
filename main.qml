import QtQuick 2.14
import QtQuick.Window 2.14
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.14

import ComponentData 1.0

ApplicationWindow {
    id: root

    visible: true
    width: 1500
    height: 900
    title: qsTr("Simple Viewer")

    background: Rectangle {
        border {
            width: 1
            color: "#000000"
        }
    }

    Rectangle {
        id: palettes

        implicitWidth: 300
        implicitHeight: 900
        color: "green"

        border {
            width: 1
            color: "#000000"
        }

        Rectangle {
            id: header

            width: parent.width
            height: 70
            border {
                width: 1
                color: "#000000"
            }

            AppText {
                anchors.centerIn: parent
                text: "Palettes"
            }
        }

        Column {
            anchors {
                top: header.bottom
                topMargin: 33
                horizontalCenter: parent.horizontalCenter
            }

            spacing: 122

            Square {}
            Circle{}
            Triangle{}
        }
    }

    Rectangle {
        id: centerArea

        anchors {
            left: palettes.right
            right: parent.right
        }
        height: parent.height
        color: "gray"
        clip: true

        Flickable {
            anchors.fill: parent
//            boundsMovement: Flickable.StopAtBounds
//            boundsBehavior: Flickable.DragOverBounds
            contentWidth: creator.width;
            contentHeight: creator.height

            Repeater {
                id: creator

                model: 3

                delegate: Rectangle {
                    id: rect
                    width: 50; height: 50
                    color: "red"

                    MouseArea {
                        anchors.fill: parent
                        drag.target: rect
                        drag.axis: Drag.XAndYAxis
                    }
                }
            }
        }
    }

    //    Rectangle {
    //        anchors.fill: parent
    //        color:"white"
    //        border.color: "black"
    //        border.width: 1
    //    }

    //    GridLayout {
    //        anchors {
    //            top: topBar.bottom
    //            left: parent.left
    //            leftMargin: 10
    //            right: sideBar.left
    //            rightMargin: 10
    //            bottom: parent.bottom
    //        }
    //        Layout.fillHeight: true
    //        Layout.fillWidth: true
    //        columns: 7

    //        Repeater {
    //            id: viewer

    //            model: _viewerManager.componentModel
    //            delegate: Component {
    //                Loader {
    //                    function getSource(type) {
    //                        switch (type) {
    //                        case ComponentData.Circle:
    //                            return "Circle.qml";
    //                        case ComponentData.Triangle:
    //                            return "Triangle.qml"
    //                        case ComponentData.Square:
    //                            return "Square.qml"
    //                        default:
    //                            return ""
    //                        }
    //                    }
    //                    source: getSource(type)
    //                    onLoaded: item.highlighted = highlight
    //                }
    //            }
    //        }
    //    }

    //    SideBar {
    //        id: sideBar

    //        anchors {
    //            top: topBar.bottom
    //            topMargin: -1
    //            right: parent.right
    //            bottom: parent.bottom
    //        }
    //    }

    //    TopBar {
    //        id: topBar

    //        anchors {
    //            top: parent.top
    //            left: parent.left
    //            right: parent.right
    //        }
    //        height: 100
    //    }
}

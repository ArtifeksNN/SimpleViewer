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

            VisualSquare {
                width: 150
                height: 150
                MouseArea {
                    anchors.fill: parent
                    onClicked: _viewerManager.addComponent(ComponentData.Square)
                }
            }

            VisualCircle {
                width: 150
                height: 150
                MouseArea {
                    anchors.fill: parent
                    onClicked: _viewerManager.addComponent(ComponentData.Circle)
                }
            }

            VisualTriangle {
                width: 150
                height: 150
                MouseArea {
                    anchors.fill: parent
                    onClicked: _viewerManager.addComponent(ComponentData.Triangle)
                }
            }
        }
    }

    Rectangle {
        id: centerArea

        anchors {
            left: palettes.right
            leftMargin: -1
            right: parent.right
        }
        height: parent.height
        clip: true
        border {
            width: 1
            color: "#000000"
        }

        Repeater {
            anchors.fill: parent
            model: _viewerManager.componentModel
            delegate: Loader {
                function getSource(type) {
                    switch (type) {
                    case ComponentData.Circle:
                        return "Circle.qml";
                    case ComponentData.Triangle:
                        return "Triangle.qml"
                    case ComponentData.Square:
                        return "Square.qml"
                    default:
                        return ""
                    }
                }
                source: getSource(itemType)
            }
        }
    }
}

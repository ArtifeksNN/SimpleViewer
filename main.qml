import QtQuick 2.14
import QtQuick.Window 2.14
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.14

import ComponentData 1.0

ApplicationWindow {
    id: root

    visible: true
    width: 800
    height: 816
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
                    onDoubleClicked: _viewerManager.addComponent(ComponentData.Square)
                }
            }

            VisualCircle {
                width: 150
                height: 150

                MouseArea {
                    anchors.fill: parent
                    onDoubleClicked: _viewerManager.addComponent(ComponentData.Circle)
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

        Rectangle {
            id: mainScreenHeader

            width: parent.width
            height: 70
            border {
                width: 1
                color: "#000000"
            }

            AppText {
                anchors.centerIn: parent
                text: "Main Screen"
            }
        }

        ListView {
            id: mainColumn

            anchors {
                top: mainScreenHeader.bottom
                topMargin: -1
                bottom: objectsNumber.top
            }

            width: parent.width
            model: _viewerManager.componentModel
            spacing: -1

            delegate: Rectangle {
                width: 500
                height: 150
                border {
                    width: 1
                    color: "#000000"
                }

                Loader {
                    anchors.centerIn: parent

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

        Rectangle {
            id: objectsNumber

            anchors {
                bottom: parent.bottom
            }

            width: parent.width
            height: 50
            border {
                width: 1
                color: "#000000"
            }

            AppText {
                anchors.centerIn: parent
                text: "Number of objects:%1".arg(1)
            }
        }
    }
}

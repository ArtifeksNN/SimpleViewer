import QtQuick 2.14
import QtQuick.Window 2.14
import QtQuick.Controls 2.14

import ComponentData 1.0

ApplicationWindow {
    id: root

    visible: true
    width: 800
    height: 816
    title: qsTr("Simple Viewer")

    Rectangle {
        id: palettes

        width: 300
        height: 900

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
            z: 2
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
                bottomMargin: -1
            }
            width: parent.width
            model: _viewerManager.componentModel
            spacing: -1

            delegate: Rectangle {
                width: 500
                height: 150

                border {
                    width: activeArea.containsMouse ? 3 : 1
                    color: activeArea.containsMouse ? "#2D9CDB" : "#000000"
                }

                Loader {
                    anchors.centerIn: parent

                    function getSource(type) {
                        switch (type) {
                        case ComponentData.Circle:
                            return "Circle.qml";
                        case ComponentData.Square:
                            return "Square.qml"
                        default:
                            return ""
                        }
                    }

                    source: getSource(itemType)
                    onLoaded: item.itemColor = itemColor
                }

                MouseArea {
                    id: activeArea

                    anchors.fill: parent
                    hoverEnabled: true
                    onDoubleClicked: {
                        _viewerManager.switchType(index)
                    }
                }
            }
        }

        Rectangle {
            id: objectsNumber

            anchors {
                bottom: parent.bottom
                bottomMargin: -1
            }

            width: parent.width
            height: 50
            z: 2
            border {
                width: 1
                color: "#000000"
            }

            AppText {
                anchors.centerIn: parent
                text: "Number of objects:%1".arg(_viewerManager.objectsCount)
            }
        }
    }
}

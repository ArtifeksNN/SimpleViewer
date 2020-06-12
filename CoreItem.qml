import QtQuick 2.14

Item {
    id: root

    property bool isHighlighted: false

    implicitWidth: 100
    implicitHeight: 100

    RotationAnimation on rotation {
        running: isHighlighted
        duration: 1000
        loops: Animation.Infinite
        from: 0
        to: 360
    }

    NumberAnimation on opacity {
        running: isHighlighted
        duration: 250
        loops: Animation.Infinite
        from: 0.5
        to: 1.0
    }

    MouseArea {
        anchors.fill: parent
        onClicked: isHighlighted = !isHighlighted
    }

    states: [
        State {
            name: "noHighlighted"
            when: !isHighlighted

            PropertyChanges {
                target: root
                opacity: 1.0
                rotation: 0
            }
        }
    ]
}

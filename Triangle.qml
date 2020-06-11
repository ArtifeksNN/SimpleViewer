import QtQuick 2.14

CoreItem {
    id: root

    Canvas {
        id: triangle

        property int triangleWidth: 150
        property int triangleHeight: 150

        anchors.fill: parent

        onPaint: {
            var ctx = getContext("2d");
            ctx.save();
            ctx.fillStyle = "#24FF00"
            ctx.clearRect(0, 0, triangle.width, triangle.height);
            ctx.beginPath();
            ctx.moveTo(0, triangleHeight);
            ctx.lineTo(triangleWidth, triangleHeight);
            ctx.lineTo(triangleWidth / 2, 0);
            ctx.closePath();
            ctx.fill()
        }
    }
}

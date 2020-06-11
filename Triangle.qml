import QtQuick 2.14

CoreItem {
    id: root

    Canvas {
        id: triangle

        anchors.fill: parent
        antialiasing: true

        onPaint: {
            let ctx = getContext("2d");
            ctx.save();
            ctx.fillStyle = "#24FF00"
            ctx.clearRect(0, 0, width, height);
            ctx.beginPath();
            ctx.moveTo(0, height);
            ctx.lineTo(width, height);
            ctx.lineTo(width / 2, 0);
            ctx.closePath();
            ctx.fill()
        }
    }

    Canvas {
        id: border

        anchors.fill: parent
        antialiasing: true
        visible: isHighlighted

        onPaint: {
            let ctx = getContext("2d");
            ctx.save();
            ctx.lineWidth = 5
            ctx.strokeStyle = "#0057FF"
            ctx.clearRect(0, 0, width, height);
            ctx.beginPath();
            ctx.moveTo(0, height);
            ctx.lineTo(width, height);
            ctx.lineTo(width / 2, 0);
            ctx.closePath();
            ctx.stroke()
        }
    }
}

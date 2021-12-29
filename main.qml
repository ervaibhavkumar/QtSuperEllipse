import QtQuick 2.12
import QtQuick.Window 2.12
import QtQml 2.0

Window {
    width: 940
    height: 940
    visible: true
    title: qsTr("Super Ellipse")
    color: "black"

    function sgn( val ) {
        if ( val > 0 ) {
            return 1;
        } else if ( val < 0 ) {
            return -1;
        } else {
            return 0;
        }
    }

    Canvas {
        id: canvas
        anchors.fill: parent

        onPaint: {
            var ctx = canvas.getContext("2d")
            ctx.reset()

            ctx.fillStyle = "white"
            ctx.strokeStyle = "white"
            ctx.lineWidth = 3

            ctx.beginPath()

            var a = 100
            var b = 100
            var n = 2;
            const center = width / 2
            var step = 2 * Math.PI / 30

            var power =  2 / n;
            for ( var angle = 0; angle < 2 * Math.PI; angle += step ) {
                var cosOfAngle = Math.cos(angle)
                var sinOfAngle = Math.sin(angle)
                var x = center + ( Math.pow( Math.abs( cosOfAngle ), power ) * a * sgn( cosOfAngle ) )
                var y = center + ( Math.pow( Math.abs( sinOfAngle ), power ) * a * sgn( sinOfAngle ) )
                ctx.lineTo(x ,y)
            }

            ctx.closePath()

            ctx.fill()
            ctx.stroke()
        }
    }

    Component.onCompleted: {
        canvas.requestPaint()
    }
}

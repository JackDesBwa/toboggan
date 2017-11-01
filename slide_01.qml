import QtQuick 2.0
import "Toboggan"

Rectangle {
    id: bg
    property alias slide: innerSlide
    property Animation openAnimation: ParallelAnimation {
        NumberAnimation {
            target: bg
            property: "opacity"
            from: 0
            to: 1
        }
        NumberAnimation {
            target: header
            property: "y"
            from: -header.height
            to: 0
        }
    }
    property Animation closeAnimation: ParallelAnimation {
        NumberAnimation {
            target: bg
            property: "opacity"
            to: 0
        }
        NumberAnimation {
            target: header
            property: "y"
            to: -header.height
        }
    }

    anchors.fill: parent
    color: "#39f"

    Rectangle {
        id: header
        anchors.right: parent.right
        color: "#6cf"
        width: 60
        height: parent.height

        Text {
            x: height + 5
            width: parent.height - 20
            height: parent.width - 10
            transform: Rotation { origin.x: 0; origin.y: 0; angle: 90 }
            text: "Toboggan"
            color: "#fff"
            font.pixelSize: 40
            fontSizeMode: Text.Fit
            horizontalAlignment: Text.AlignRight
        }
    }
    Slide {
        id: innerSlide
        anchors {
            top: parent.top
            left: parent.left
            bottom: parent.bottom
            right: header.left
        }
        clip: true
        prefix: Qt.resolvedUrl("slide_01_")
    }
}

import QtQuick 2.0
import "Toboggan"

Slide {
    id: slide
    openAnimation:
        NumberAnimation {
        target: slide
        property: "opacity"
        from: 0
        to: 1
    }
    closeAnimation:
        NumberAnimation {
        target: slide
        property: "opacity"
        to: 0
    }
    Column {
        spacing: 40
        anchors.centerIn: parent
        Text {
            color: "#6cf"
            font.pixelSize: 180
            text: "Toboggan"
        }
        Text {
            id: txtSpace
            anchors.horizontalCenter: parent.horizontalCenter
            color: "#ccc"
            font.pixelSize: 60
            text: "Press space to continue"
            NumberAnimation {
                target: txtSpace
                running: true
                property: "opacity"
                easing.type: Easing.InOutCubic
                duration: 2500
                from: 0
                to: 1
            }
        }
    }
}

import QtQuick 2.0
import "Toboggan"

Slide {
    id: slide
    steps: 5
    openAnimation: NumberAnimation {
        target: slide
        property: "opacity"
        from: 0
        to: 1
    }
    closeAnimation: NumberAnimation {
        target: slide
        property: "opacity"
        to: 0
    }

    Text {
        anchors.centerIn: parent
        color: "#fff"
        font.pixelSize: 60
        text: "1 - " + slide.step
    }
}

import QtQuick 2.0
import "Toboggan"

Slide {
    id: slide
    steps: 5
    Text {
        anchors.centerIn: parent
        color: "#fff"
        font.pixelSize: 60
        text: "2 - 1 - " + slide.step
    }
}

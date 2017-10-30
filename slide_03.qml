import QtQuick 2.0

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
        text: "3 - " + slide.step
    }
}

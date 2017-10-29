import QtQuick 2.0

Slide {
    id: slide
    steps: 5
    openAnimation: NumberAnimation {
        target: slide
        property: "x"
        from: width
        to: 0
    }
    closeAnimation: NumberAnimation {
        target: slide
        property: "x"
        to: -width
    }

    Text {
        anchors.centerIn: parent
        color: "#fff"
        font.pixelSize: 60
        text: slide.step
    }
}

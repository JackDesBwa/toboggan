import QtQuick 2.0
import "Toboggan"

Slide {
    id: slide

    openAnimation: ParallelAnimation {
        NumberAnimation {
            target: centralTexts
            property: "x"
            from: slide.width
            to: 0
        }
        NumberAnimation {
            target: txtDesc
            property: "opacity"
            from: 0
            to: 1
        }
        NumberAnimation {
            target: txtTitle
            property: "y"
            from: -txtTitle.height
            to: 0
        }
    }
    closeAnimation: ParallelAnimation {
        NumberAnimation {
            target: centralTexts
            property: "x"
            to: -slide.width
        }
        NumberAnimation {
            target: txtDesc
            property: "opacity"
            to: 0
        }
        NumberAnimation {
            target: txtTitle
            property: "y"
            to: -txtTitle.height
        }
    }

    Text {
        id: txtTitle
        x: 20
        width: parent.width - x
        text: "Fullscreen"
        color: "#fff"
        font.pixelSize: 100
    }

    Text {
        id: txtDesc
        x: 20
        y: txtTitle.height
        width: parent.width - x
        text: "Toboggan can be displayed in fullscreen or in windowed mode."
        color: "#fff"
        wrapMode: Text.WordWrap
        font.pixelSize: 40
    }

    Item {
        id: centralTexts
        width: parent.width
        height: parent.height
        Column {
            anchors.centerIn: parent
            anchors.verticalCenterOffset: 80
            Text {
                color: "#fff"
                font.pixelSize: 60
                text: "Toggle fullscreen"
            }
            Text {
                color: "#fff"
                font.pixelSize: 40
                text: "F, F11"
            }
            Text {
                color: "#fff"
                font.pixelSize: 60
                text: "Escape"
            }
            Text {
                color: "#fff"
                font.pixelSize: 40
                text: "When in fullscreen mode, Escape changes to windowed mode<br>When in windowed mode, Escape quits"
            }
        }
    }
}

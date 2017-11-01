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
        text: "Multidimentional"
        color: "#fff"
        font.pixelSize: 100
    }

    Text {
        id: txtDesc
        x: 20
        y: txtTitle.height
        width: parent.width - x
        text: "Toboggan is multidimentional. Each slide can raffine the content in a new dimention. To skip whole dimention and subdimentions content, use quick navigation."
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
                text: "Quick Next"
            }
            Text {
                color: "#fff"
                font.pixelSize: 40
                text: "PageUp, Up (arrow), Z, W, K"
            }
            Text {
                color: "#fff"
                font.pixelSize: 60
                text: "Quick Previous"
            }
            Text {
                color: "#fff"
                font.pixelSize: 40
                text: "PageDown, Down (arrow), S, J"
            }
        }
    }
}

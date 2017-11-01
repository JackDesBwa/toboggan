import QtQuick 2.0
import "Toboggan"

Slide {
    id: slide
    steps: 5

    openAnimation: ParallelAnimation {
        NumberAnimation {
            target: navbar
            property: "y"
            from: slide.height+navbar.height
            to: slide.height-navbar.height-15
        }
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
            target: navbar
            property: "y"
            to: slide.height+navbar.height
        }
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
        text: "Navigation keys"
        color: "#fff"
        font.pixelSize: 100
    }

    Text {
        id: txtDesc
        x: 20
        y: txtTitle.height
        width: parent.width - x
        text: "Several keys are available to navigate. They correspond to different conventions so that you can choose the one you like. Try it on these slides."
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
                text: "Next"
            }
            Text {
                color: "#fff"
                font.pixelSize: 40
                text: "Return, Space, Right (arrow), Left (mouse), D, L"
            }
            Text {
                color: "#fff"
                font.pixelSize: 60
                text: "Previous"
                opacity: step > 0 ? 1 : 0
                Behavior on opacity { NumberAnimation {} }
            }
            Text {
                color: "#fff"
                font.pixelSize: 40
                text: "Backspace, Left (arrow), Right (mouse), Q, A, H"
                opacity: step > 0 ? 1 : 0
                Behavior on opacity { NumberAnimation {} }
            }
        }
    }


    Item {
        id: navbar
        property real bw: (width-height)/(steps-1)
        x: 15
        width: parent.width - 30
        height: 30
        Rectangle {
            x: parent.height/2
            y: x - height/2
            height: 4
            width: parent.width - parent.height
        }
        Repeater {
            model: steps
            Rectangle {
                x: index*navbar.bw
                width: navbar.height
                height: width
                radius: width/2
            }
        }
        Rectangle {
            x: step*navbar.bw+3
            y: 3
            width: navbar.height-6
            height: width
            radius: width/2
            color: "#fc3"
            Behavior on x { NumberAnimation {} }
        }
    }
}

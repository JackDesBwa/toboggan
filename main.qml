import QtQuick 2.0
import QtQuick.Window 2.1

Window {
    id: win
    visible: true
    width: 800
    height: 600
    title: qsTr("Presentation")
    color: "#000"

    function fullscreen(type) {
        if (type == 2)
            win.visibility = (win.visibility == Window.FullScreen) ? Window.Windowed : Window.FullScreen;
        else if (type == 1)
            win.visibility = Window.FullScreen;
        else
            win.visibility = Window.Windowed;
    }

    MouseArea {
        anchors.fill: parent
        onDoubleClicked: win.fullscreen(2)
    }

    Rectangle {
        id: frame
        anchors.centerIn: parent
        width: 1280
        height: 800
        color: "#000"
        scale: (win.width/width < win.height/height) ? win.width/width : win.height/height
        focus: true

        Slide {
            id: slideView
            anchors.fill: parent
            clip: true
            prefix: "slide_"
        }

        Keys.onPressed: {
            if (event.key == Qt.Key_Return || event.key == Qt.Key_Space || event.key == Qt.Key_Right) {
                slideView.next();
                event.accepted = true;

            } else if (event.key == Qt.Key_Backspace || event.key == Qt.Key_Left) {
                slideView.previous();
                event.accepted = true;

            } else if (event.key == Qt.Key_PageUp) {
                slideView.next(true);
                event.accepted = true;

            } else if (event.key == Qt.Key_PageDown) {
                slideView.previous(true);
                event.accepted = true;

            } else if (event.key == Qt.Key_F) {
                win.fullscreen(2);
                event.accepted = true;

            } else if (event.key == Qt.Key_Escape) {
                if (visibility == Window.Windowed)
                    Qt.quit();
                else
                    win.fullscreen(0);
                event.accepted = true;
            }
        }
    }
}

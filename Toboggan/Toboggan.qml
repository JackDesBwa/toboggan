import QtQuick 2.0
import QtQuick.Window 2.1

Window {
    id: win
    visible: true
    width: 800
    height: 600
    title: qsTr("Toboggan")
    color: "#000"

    property string prefix: "slide_"

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
        acceptedButtons: Qt.LeftButton | Qt.RightButton
        onDoubleClicked: {
            if (slideView.slide == -1)
                win.fullscreen(2)
        }
        onClicked: {
            if (mouse.button == Qt.RightButton)
                slideView.previous();
            else
                slideView.next();
        }
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
            prefix: win.prefix
        }

        Keys.onPressed: {
            if([Qt.Key_Return, Qt.Key_Space, Qt.Key_Right, Qt.Key_D, Qt.Key_L].indexOf(event.key) !== -1) {
                slideView.next();
                event.accepted = true;

            } else if([Qt.Key_Backspace, Qt.Key_Left, Qt.Key_Q, Qt.Key_A, Qt.Key_H].indexOf(event.key) !== -1) {
                slideView.previous();
                event.accepted = true;

            } else if([Qt.Key_PageUp, Qt.Key_Up, Qt.Key_Z, Qt.Key_W, Qt.Key_K].indexOf(event.key) !== -1) {
                slideView.next(true);
                event.accepted = true;

            } else if([Qt.Key_PageDown, Qt.Key_Down, Qt.Key_S, Qt.Key_J].indexOf(event.key) !== -1) {
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

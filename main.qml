import QtQuick 2.0
import QtQuick.Window 2.1

Window {
    id: win
    visible: true
    width: 800
    height: 600
    title: qsTr("Présentation Moiré")
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
        anchors.centerIn: parent
        width: 1280
        height: 800
        color: "#000"
        scale: (win.width/width < win.height/height) ? win.width/width : win.height/height
        focus: true

        Keys.onPressed: {
            if (event.key == Qt.Key_Return || event.key == Qt.Key_Right) {
                event.accepted = true;

            } else if (event.key == Qt.Key_Backspace || event.key == Qt.Key_Left) {
                event.accepted = true;

            } else if (event.key == Qt.Key_F) {
                win.fullscreen(2);
                event.accepted = true;

            } else if (event.key == Qt.Key_Escape) {
                win.fullscreen(0);
                event.accepted = true;
            }
        }
    }
}

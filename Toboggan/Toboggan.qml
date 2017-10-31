import QtQuick 2.0
import QtQuick.Window 2.1

/*
Copyright 2017 JackDesBwa

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

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

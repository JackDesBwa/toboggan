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

    property int slide: -1
    property variant currentSlide

    function gotoSlide(nr) {
        if (nr < 0) {
            if (currentSlide)
                currentSlide.close();
            currentSlide = undefined;
            slide = -1;
            return;
        }
        var url = Qt.resolvedUrl("./slides/slide_" + ("00"+nr).slice(-2) + ".qml");
        var component = Qt.createComponent(url);
        if (component.status == Component.Ready) {
            var obj = component.createObject(frame);
            if (obj) {
                if (currentSlide)
                    currentSlide.close();
                currentSlide = obj;
                slide = nr;
                obj.open();
            } else {
                console.warn("Error while creating object", url)
            }
        } else {
            console.warn("Component creation failed :", component.status, url, component.errorString())
        }
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
        clip: true

        Keys.onPressed: {
            if (event.key == Qt.Key_Return || event.key == Qt.Key_Space || event.key == Qt.Key_Right) {
                if (!currentSlide || !currentSlide.next())
                    gotoSlide(slide + 1);
                event.accepted = true;

            } else if (event.key == Qt.Key_Backspace || event.key == Qt.Key_Left) {
                if (!currentSlide || !currentSlide.previous())
                    gotoSlide(slide - 1);
                event.accepted = true;

            } else if (event.key == Qt.Key_PageUp) {
                gotoSlide(slide + 1);
                event.accepted = true;

            } else if (event.key == Qt.Key_PageDown) {
                gotoSlide(slide - 1);
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

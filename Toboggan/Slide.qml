import QtQuick 2.0

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

Item {
    id: slide

    property int step: 0 ///< Current step
    property int steps: 1 ///< Number of steps
    property variant currentSlide ///< Current subslide object
    property string prefix ///< Prefix for subslides

    property Animation openAnimation: NumberAnimation {
        target: slide
        property: "x"
        from: width
        to: 0
    }
    property Animation closeAnimation: NumberAnimation {
        target: slide
        property: "x"
        to: -width
    }

    // Function called at opening
    function open() {
        if (openAnimation)
            openAnimation.start();
    }

    // Function called at closing
    // @note May be called when step is not the last one
    function close() {
        if (closeAnimation) {
            closeAnimation.runningChanged.connect(function() {
                if (!closeAnimation.running)
                    destroy();
            });
            closeAnimation.start();
        } else {
            destroy();
        }
    }

    // Go directly to one step
    // @param nr Number of the step
    // @return true if next step available, false otherwise
    function go(nr) {
        if (nr < 0) {
            if (currentSlide)
                currentSlide.close();
            currentSlide = undefined;
            step = 0;
            return false;
        }
        if (!prefix) {
            if (nr > steps)
                return false;
            step = nr;
            return true;
        }
        var url = prefix + ("00"+nr).slice(-2) + ".qml";
        var component = Qt.createComponent(url);
        if (component.status == Component.Ready) {
            var obj = component.createObject(slide);
            if (obj) {
                if (currentSlide)
                    currentSlide.close();
                currentSlide = obj;
                step = nr;
                obj.open();
                return true;
            } else {
                console.warn("Error while creating object", url)
            }
        } else {
            console.warn("Component creation failed :", component.status, url, component.errorString())
        }
        return false;
    }

    // Go one step forward
    // @return true if next step available, false otherwise
    function next(quick) {
        if (!quick) {
            if (!currentSlide) {
                if (prefix) {
                    return go(0);
                } else if (step + 1 >= steps)
                    return false;
                step++;
                return true;
            } else if (!currentSlide.next(quick)) {
                return next(true);
            } else {
                return true;
            }
        } else {
            if (currentSlide && !currentSlide.next(quick)) {
                return go(step + 1);
            } else if (prefix && !currentSlide) {
                return go(0);
            }
            return false;
        }
    }

    // Go one step backward
    // @return true if previous step available, false otherwise
    function previous(quick) {
        if (!quick) {
            if (!currentSlide)
                return previous(true);
            else if (currentSlide && !currentSlide.previous(quick))
                return previous(true);
            else
                return true;
        }
        if (prefix) {
            return go(step - 1);
        } else if (step < 1)
            return false;
        step--;
        return true;
    }

    implicitWidth: 1280
    implicitHeight: 800

    Component.onCompleted: if (prefix) go(0);
}

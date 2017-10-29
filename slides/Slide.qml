import QtQuick 2.0

Item {
    id: slide
    width: 1280
    height: 800

    property int step: 0 ///< Current step
    property int steps: 1 ///< Number of steps

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

    // Go one step forward
    // @return true if next step available, false otherwise
    function next() {
        if (step + 1 >= steps) {
            return false;
        }
        step++;
        return true;
    }

    // Go one step backward
    // @return true if previous step available, false otherwise
    function previous() {
        if (step < 1)
            return false;
        step--;
        return true;
    }
}

========
Toboggan
========

This presentation slides where made with toboggan.

What is it ?
============

Toboggan is a presenter project based on QML, a descriptive programming language
created by Qt.

It is a minimal tool to help creating interactive presentations.

Why another presenter program ?
===============================

For a talk I presented, I needed a special support: interactive one. I did not
found the right tool, thus I created it. And now, I share it in case you need
something similar.

QML technology is well suited for the purpose because of several reasons:

- It allows *quick prototyping* of user interfaces (by typing or with tools)
  
- Animations are native, so that it is quite easy to create *complex animations*

- You can script (javascript) to add *interactivity*

- There are complex objets such as *canvas* and *shaders* for really fine
  explanation examples (ex. interactive drawings)

- etc.

How did you find this crazy name ?
==================================

Toboggan is a play on words (slide) and does not seem to be used for a presenter
program yet. Names are hard to find.

How to launch ?
===============

This is pure QML, thus you can launch with *qmlscene* program, a prototyping
tool which is part of Qt5 project (qt5-declarative).

qmlscene --fullscreen toboggan.qml

This tool itself uses QML2 only, but the presentation can use any QML plugin
such as QtMultimedia for videos.

Where is documentation ?
========================

The example presentation slides are made with toboggan itself and presents main
aspects of the tiny tool. It is self descriptive in both meanings that it is
written in its own terms so that it is an example of itself ; and that the
subject of the presentation is (will be?) its usage.

More useful documentation is about the language in which slides are created. A
wonderful collaborative book is available at https://qmlbook.github.io/ while
main documentation can be found at http://doc.qt.io/qt-5/qmlapplications.html
and more precisely in pages describing each object type.

Licence
=======

Licence of presentation tool (toboggan) is MIT.

Licence of slides is CC BY-SA 3.0, see https://creativecommons.org/licenses/by-sa/3.0/

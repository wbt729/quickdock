import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Window 2.12
import QtQuick.Controls.Material 2.12

Item {
    id: root
    default property alias contents: placeholder.data
    property alias title: titleLabel.text
    implicitHeight: 190
    Rectangle {
        id: content
        anchors.fill: parent
        width: 200
        height: implicitHeight
        state: "docked"
        color: "#cfcfcf"
        ToolBar {
            id: toolBar
            anchors { top: parent.top; left: parent.left; right: parent.right }
            Label {
                id: titleLabel
                anchors { left: parent.left; leftMargin: 8; verticalCenter: parent.verticalCenter }
            }
            MouseArea {
                id: dragMouseArea
                anchors.fill: parent
                property variant clickPos: "1,1"
                onPressed: {
                    clickPos = Qt.point(mouse.x,mouse.y)
                }

                onPositionChanged: {
                    var delta = Qt.point(mouse.x-clickPos.x, mouse.y-clickPos.y)
                    var new_x = window.x + delta.x
                    var new_y = window.y + delta.y
//                    if (new_y <= 0)
//                        window.visibility = Window.Maximized
//                    else
//                    {
//                        if (window.visibility === Window.Maximized)
//                            window.visibility = Window.Windowed
                        window.x = new_x
                        window.y = new_y
//                    }
                }
            }

            Row {
                anchors { right: parent.right; verticalCenter: parent.verticalCenter; rightMargin: 8 }
                Button {
                    flat: true
                    icon.source: content.state == "docked" ?
                                     "qrc:/icons/launch-24px.svg" : "qrc:/icons/close-24px.svg"
                    onClicked: {
                        if(content.state == "docked")
                            content.state = "undocked"
                        else
                            content.state = "docked"
                    }
                }
            }
        }
        Item {
            id: placeholder
            anchors { top: toolBar.bottom; left: parent.left; right: parent.right; bottom: parent.bottom }
        }
        states: [
            State {
                name: "undocked"
                PropertyChanges { target: root; height: 0 }
                PropertyChanges { target: window; visible: true }
                ParentChange { target: content; parent: undockedContainer }
            },
            State {
                name: "docked"
                PropertyChanges { target: root; height: implicitHeight }
                PropertyChanges { target: window; visible: false }
                ParentChange { target: content; parent: root }
            }
        ]
    }
    Window {
        id: window
        width: 320;
        height: 240;
        flags: Qt.FramelessWindowHint

        Item {
            id: undockedContainer
            anchors.fill: parent
        }

        onClosing: {
            content.state = "docked"
        }
    }
}

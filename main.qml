import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

ApplicationWindow {
    visible: true
    width: 800
    height: 600
    title: qsTr("QuickDock Docking Example")

    Item {
        id: dock
        anchors { left: parent.left; top: parent.top; bottom: parent.bottom; margins: 8}
        width: 250
        Column {
            anchors.fill: parent
            spacing: 8
            Dockable {
                title: qsTr("Dockable A")
                anchors { left: parent.left; right: parent.right}
                contents: Label {
                    anchors.centerIn: parent
                    text: "A"
                    font.pointSize: 48
                }
            }
            Dockable {
                title: qsTr("Dockable B")
                anchors { left: parent.left; right: parent.right}
                contents: Label {
                    anchors.centerIn: parent
                    text: "B"
                    font.pointSize: 48
                }
            }
            Dockable {
                title: qsTr("Dockable C")
                anchors { left: parent.left; right: parent.right}
                contents: Label {
                    anchors.centerIn: parent
                    text: "C"
                    font.pointSize: 48
                }
            }
        }
    }
    Item {
        anchors { left: dock.right; top: parent.top; bottom: parent.bottom; right: parent.right }
        Label {
            anchors.centerIn: parent
            text: "Content"
            font.pointSize: 48
        }
    }
}

import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.2
import QtQuick.Shapes 1.12
import QtGraphicalEffects 1.12
import "Resources"
Window {
    visible: true
    width: 340
    height: 500
    title: qsTr("StopWatch")
    StopWatch{
        anchors.centerIn: parent
        width: parent.width
        height: parent.height
    }
}

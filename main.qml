import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.2
import "Resources"

Window {
    visible: true
    width: 300
    height: 480
    title: qsTr("StopWatch")

    StopWatch{
        anchors.centerIn: parent
        width: parent.width
        height: parent.height
    }

}

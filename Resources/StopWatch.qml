import QtQuick 2.12
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.12
import StopWatch 1.0

Rectangle {

    color: "#4d5254"
    width: 300
    height: 400

    StopWatch{
        id: stopWatch
    }

    Row{
        id: row
        width: parent.width/1.3
        height: parent.height/8
        anchors.left: parent.left
        anchors.leftMargin: (parent.width-row.width)/2
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 40
        spacing: 40
        //button start
        Rectangle{
            height: parent.height
            width: height
            color: "transparent"
            Text {
                anchors.fill: parent
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }
            MouseArea{
                id: buttonStart
                anchors.fill: parent
                onClicked: stopWatch.on_start_button_clicked()
            }
            Image {
                anchors.fill: parent
                source: buttonStart.pressed ? "/Start2.png" : "/Start1.png"
            }
        }
        //button stop
        Rectangle{
            color: "transparent"
            height: parent.height
            width: height
            anchors.right: parent.right
            Text {
                id: stop
                anchors.fill: parent
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }
            MouseArea{
                id: buttonStop
                anchors.fill: parent
                onClicked: stopWatch.on_stop_button_clicked()
            }
            Image {
                anchors.fill: parent
                source: buttonStop.pressed ? "/Stop2.png" : "/Stop1.png"
            }
        }
    }

    // button exit app
    Rectangle {
        color: "transparent"
        height: row.height
        anchors.rightMargin: (parent.width-row.width)/2
        width: height
        anchors.top: parent.top
        anchors.topMargin: 40
        anchors.right: parent.right
        MouseArea{
            id: buttonCancel
            anchors.fill: parent
            onClicked: Qt.quit()
        }
        Image {
            anchors.fill: parent
            source: buttonCancel.pressed ? "/Exit2.png" : "/Exit1.png"
        }
    }

    Text {
        id:textStopWatch
        anchors.centerIn: parent
        width: 280
        height: 100
        text: stopWatch.time
        font.weight: Font.DemiBold
        font.family: "Verdana"
        font.letterSpacing: 3.3
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 45
    }

    LinearGradient {
        anchors.fill: textStopWatch
        source: textStopWatch
        start: Qt.point(280, 0)
        end: Qt.point(0, 0)
        gradient: Gradient {
            GradientStop { position: 0; color: "#4caefe" }
            GradientStop { position: 1; color: "#02f0fe" }
        }
    }

}


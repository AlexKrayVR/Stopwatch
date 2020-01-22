import QtQuick 2.12
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.12
import StopWatch 1.0
import Circle 1.0

Rectangle {
    color: "#4d5254"
    antialiasing: true
    width: 340
    height: 500

    property bool checkStop: false

    StopWatch{
        id: stopWatch
    }

    //stroke
    Rectangle{
        id:borderRect
        anchors.centerIn: parent
        width: parent.width-20
        height: width
        radius: width
        border.color: "#e49696"
        color: "transparent"
        border.width: 5
    }

    //stopWatch.time
    Row{
        id: row
        width: parent.width/1.3
        height: parent.height/8
        antialiasing: true
        anchors.left: parent.left
        anchors.leftMargin: (parent.width-row.width)/2
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        spacing: 40
        //button start
        Rectangle{
            height: parent.height
            width: height
            color: "transparent"
            antialiasing: true
            Text {
                anchors.fill: parent
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }
            MouseArea{
                id: buttonStart
                antialiasing: true
                anchors.fill: parent
                onClicked: {
                    stopWatch.on_start_button_clicked()
                    if(timer.running){
                        circleMain.angle=0
                    }
                    timer.running=true
                }
            }
            Image {
                antialiasing: true
                anchors.fill: parent
                source: buttonStart.pressed ? "/Start2.png" : "/Start1.png"
            }
        }
        //button stop
        Rectangle{
            color: "transparent"
            antialiasing: true
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
                antialiasing: true
                anchors.fill: parent
                onClicked: {
                    stopWatch.on_stop_button_clicked()
                    checkStop=true
                    if(timer.running){
                        timer.running=false
                    }else{
                        checkStop=false
                        circleMain.angle=0
                    }
                }
            }
            Image {
                antialiasing: true
                anchors.fill: parent
                source: buttonStop.pressed ? "/Stop2.png" : "/Stop1.png"
            }
        }
    }

    // button exit app
    Rectangle {
        color: "transparent"
        antialiasing: true
        height: row.height
        anchors.rightMargin: (parent.width-row.width)/2-10
        width: height
        anchors.top: parent.top
        anchors.topMargin: 30
        anchors.right: parent.right
        MouseArea{
            id: buttonCancel
            antialiasing: true
            anchors.fill: parent
            onClicked: Qt.quit()
        }
        Image {
            antialiasing: true
            anchors.fill: parent
            source: buttonCancel.pressed ? "/Exit2.png" : "/Exit1.png"
        }
    }

    //text timer
    Text {
        id:textStopWatch
        anchors.centerIn: parent
        width: parent.width-30
        height: parent.height/6
        text: stopWatch.time
        fontSizeMode: Text.Fit
        font.weight: Font.DemiBold
        font.family: "Verdana"
        font.letterSpacing: 3.3
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 50
    }

    //circle C++
    Rectangle{
        anchors.centerIn: parent
        width: parent.width-20
        height: width
        color: "transparent"
        Circle{
            id:circleMain
            anchors.fill: parent
        }
    }

    //circle drawing timer
    Timer {
        id: timer
        interval: 100;
        running: false;
        repeat: true;
        onTriggered: {
            circleMain.angle-=0.6
        }
    }

    //gradient for text
    LinearGradient {
        antialiasing: true
        anchors.fill: textStopWatch
        source: textStopWatch
        start: Qt.point(280, 0)
        end: Qt.point(0, 0)
        gradient: Gradient {
            GradientStop { position: 0; color: "#4caefe" }
            GradientStop { position: 1; color: "#02f0fe" }
        }
    }

    //gradient for stroke
    LinearGradient {
        antialiasing: true
        anchors.fill: borderRect
        source: borderRect
        start: Qt.point(280, 0)
        end: Qt.point(0, 0)
        gradient: Gradient {
            GradientStop { position: 0; color: "#4caefe" }
            GradientStop { position: 1; color: "#02f0fe" }
        }
    }
}


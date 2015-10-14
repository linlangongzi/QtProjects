import QtQuick 1.0
//import "image"
//import "../untitled/Title.qml"
Item
{
    id:rec;  width: 800;  height: 480
    property bool countor: true
    property int i: 0
//    Connections
//    {
//        onlightStateChanged:
//        {
//            console.log("xiaoxiaozhuzhuzhu")
//        }
//    }

    Image
    {
        id: background
        anchors.fill: parent
        source: if(i==0)
                {
                    "image/fbd.jpg"
                }
                else if(i==1)
                {
                    "image/finalBackground1.jpg"
                }
                else if(i==2)
                {
                    "image/finalBackground2.jpg"
                }
                else if(i==3)
                {
                    "image/finalBackground3.jpg"
                }
                else if(i==4)
                {
                    "image/finalBackground4.jpg"
                }
                else
                {
                    "image/finalBackground5.jpg"
                }
    }
    //
    //              标题
    //
    Title
    {
        id:title
    }
    Picture_and_Introduction
    {
        id:pic
    }

    //
    //              模块
    //
        Module_0
        {
            id:module_0
        }

        Module_1
        {
            id:module_1
        }

        Module_2
        {
            id: module_2
        }
     //
        // Date and Time
    Text
    {
        id: clock_text;  x: 620; y: 455; font.pointSize: 13; color: "white"
        text: Qt.formatDateTime(new Date(),"yyyy-MM-dd ")+Qt.formatTime(new Date(),"hh:mm:ss")
    }
    Timer
    {
        id: timer_for_clock; interval: 1000; repeat: true ; running: true
        onTriggered:
        {
            clock_text.text =  Qt.formatDateTime(new Date(),"yyyy-MM-dd ")+Qt.formatTime(new Date(),"hh:mm:ss")
        }
    }
    Text
    {
        id: text_background;  visible: false;  font.pointSize: 12; color: "white"
        anchors.bottom: rec.bottom;  anchors.left:mouseArea_changeBackGround.right
        text: qsTr(" < Change BackGound")
    }
    MouseArea
    {
        id:mouseArea_changeBackGround;  width: 30;  height: 20
        anchors.bottom: rec.bottom  
        hoverEnabled: true
//        Rectangle
//        {
//            anchors.fill: parent
//            border.color: "blue"
//            color: "Transparent"
//        }
        onEntered:
        {
            text_background.visible = true
        }
        onExited:
        {
            text_background.visible = false
        }
        onClicked:
        {
            i++
            if(i>5)
            {
                i = 0
            }
        }

    }
}

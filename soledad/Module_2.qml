import QtQuick 1.0
//import "../untitled/image"
Item
{
    property bool i_acc: false
    property bool isup: false
    x:290;  y:293;  width: 480;  height: 150
    Image { id: module_image_2;  anchors.fill: parent;  source: "image/aaaaa.png";z:-1  }
    MouseArea
    {
        anchors.fill: parent;  hoverEnabled: true
        onEntered: module_image_2.source = "image/bbbbb.png"
        onExited: module_image_2.source = "image/aaaaa.png"
    }
//    Connections
//    {
//        target: sensor
//        onTemperatureChanged:
//        {

//        }
//    }

    //
    //
    Flickable
    {
                id: visual;  height: 85;  width:300
                contentWidth: 1200;contentHeight: 85
                anchors.left: decorater.right;  anchors.bottom: decorater.bottom; anchors.leftMargin: 20 ;   clip:true
                Behavior on contentX {PropertyAnimation {duration: 600; easing.type: Easing.OutQuint }}
                onContentXChanged:
                {
                    if(visual.contentX < 0)
                        visual.contentX = 0
                    else if(visual.contentX > 930)
                        visual.contentX = 930
                 }
               // property string wet: ""
                Component.onCompleted:
                {
                   // wet = ssr.getTemperature()
                    console.log("wet is ",ssr.getTemperature())
                }

                Row
                {
                    spacing: 10
                    Item
                    {
                        height: 85; width: 300
                        Text { id:sign; anchors.top: parent.top; anchors.topMargin: 5;  text:"Temperature";color: "grey"; font.pointSize:15   }
                        Text {  id:value_text;  anchors.top: sign.bottom; anchors.topMargin: 5;  text:"value >"; color: "grey"; font.pointSize:15  }
                        Image
                        {
                              id: pointer
                               x:temp_buff.x+temp_buff.width-25
                               y:value_text.y
                               source: "image/pointer.png"
                              Text { id: value_number;  anchors.centerIn: pointer ; anchors.verticalCenterOffset: -3;  font.pointSize: 12;  color: "white"
                                        text: ssr.temperature}
                        }
                         Image {   id: temp_duration;   y:70 ; width: parent.width;   source: "image/ft.png"
                                     Image {  id: temp_buffer;   source: "image/tb.png";   width: (ssr.temperature+18)/3
                                                Image {  id: temp_buff;  source: "image/temperatureplayed.png";   width: (ssr.temperature+2)/3; } } }
                     }
                    Item
                    {
                        height: 85; width: 300
                        Text { id:sign_1; anchors.top: parent.top; anchors.topMargin: 5;  text:"Wet";color: "grey"; font.pointSize:15   }
                        Text {  id:value_text_1;  anchors.top: sign_1.bottom; anchors.topMargin: 5;  text:"value >"; color: "grey"; font.pointSize:15  }
                        Image
                        {
                              id: pointer_1
                               x:wet_c.x+wet_c.width-25
                               y:value_text_1.y
                               source: "image/pointer.png"
                              Text { id: value_number_1;  anchors.centerIn: pointer_1 ; anchors.verticalCenterOffset: -3;  font.pointSize: 12;  color: "white"
                                        text: ssr.wet}
                        }
                         Image {   id: wet_a;   y:70 ; width: parent.width;   source: "image/ft.png"
                                     Image {  id: wet_b;   source: "image/forwetbg.png";   width: (ssr.wet+18)/3
                                                Image {  id: wet_c;  source: "image/forwetduration.png";   width: (ssr.wet+2)/3; } } }
                     }
                    Item
                    {
                        height: 85; width: 300
                        Text { id:sign_2; anchors.top: parent.top; anchors.topMargin: 5;  text:"Smoke";color: "grey"; font.pointSize:15   }
                        Text {  id:value_text_2;  anchors.top: sign_2.bottom; anchors.topMargin: 5;  text:"Status >"; color: "grey"; font.pointSize:15  }
                        Image
                        {
                              id: pointer_2
                               x:temp_buff_2.x+temp_buff_2.width-25
                               y:value_text_2.y
                               source: "image/pointer.png"
                              Text { id: value_number_2;  anchors.centerIn: pointer_2 ; anchors.verticalCenterOffset: -3;  font.pointSize: 12;  color: "white"
                                        text:ssr.getSmoke()===true?"Smoke":"NoSmoke"}
                        }
                         Image {   id: temp_duration_2;   y:70 ; width: parent.width;   source: "image/ft.png"
                                     Image {  id: temp_buffer_2;   source: "image/pa.png";   width: ssr.getSmoke()===true?220:145
                                                Image {  id: temp_buff_2;  source: "image/pb.png";   width: ssr.getSmoke()===true?195:120 } } }
                     }
                    Item
                    {
                        height: 85; width: 300
                        Text { id:sign_3; anchors.top: parent.top; anchors.topMargin: 5;  text:"Wind";color: "grey"; font.pointSize:15   }
                        Text {  id:value_text_3;  anchors.top: sign_3.bottom; anchors.topMargin: 5;  text:"value >"; color: "grey"; font.pointSize:15  }
                        Image
                        {
                              id: pointer_3
                               x:temp_buff_3.x+temp_buff_3.width-25
                               y:value_text_3.y
                               source: "image/pointer.png"
                              Text { id: value_number_3;  anchors.centerIn: pointer_3 ; anchors.verticalCenterOffset: -3;  font.pointSize: 12;  color: "white"
                                        text: "240"}
                        }
                         Image {   id: temp_duration_3;   y:70 ; width: parent.width;   source: "image/ft.png"
                                     Image {  id: temp_buffer_3;   source: "image/wg.png";   width: 230+50
                                                Image {  id: temp_buff_3;  source: "image/wd.png";   width: 230; } } }
                     }
                }
    }

    Image
    {
        id: decorater; height: 85;  width: 100;
        anchors.left:parent.left; anchors.leftMargin: 30; source: "image/fp.jpg"
        anchors.top: parent.top ; anchors.topMargin: 15
    }
    Image
    {
        id: send;  source: "image/sbg.png" ;width: 100; height:25;
        anchors.top:decorater.bottom;  anchors.topMargin: 7;anchors.left: decorater.left
        Image {  id: send_icon;  source: "image/Send.png"; anchors{left:send.left; leftMargin: 10; top:send.top ; topMargin: 5;} width: 15;height: 13;}
        Text
        {
            id: send_information; color: "white"; text: qsTr("Send");
            anchors{left:send_icon.right; leftMargin: 15; bottom:send_icon.bottom }
            font.pixelSize:13;font.bold :true;
        }
        MouseArea
        {
            anchors.fill: parent
            onPressed:  { send.source = "image/sbgc.png";  send_icon.source = "image/Sendchange.png";   send_information.color = "darkgrey" }
            onReleased:  {  send.source = "image/sbg.png";    send_icon.source = "image/Send.png";  send_information.color = "white" }
        }
    }

    Row
    {
        anchors.bottom: send.bottom
        anchors.left: send.right
        anchors.leftMargin: 20
        spacing: 30
        Image
        { id: play; source: "image/pl.png";width: 30;height: 30;
            MouseArea
            {
                anchors.fill: parent
                onPressed: parent.source = "image/plc.png"
                onReleased:
                {
                    parent.source = "image/pl.png"
                    console.log("Play Pressed")
                }
            }
        }
        Image
        { id: previous; source: "image/pre.png";width: 20;height: 13; anchors.bottom: play.bottom;anchors.bottomMargin: 7
            MouseArea
            {
                anchors.fill: parent
                onPressed: parent.source = "image/prec.png"
                onReleased:
                {
                    parent.source = "image/pre.png"
//                    if(visual.contentX < 310)
//                        visual.contentX = 1240
                    console.log(visual.contentX-=310)

                }
            }
        }
        Image
        { id: next; source: "image/next.png";width: 20;height: 13;  anchors.bottom: play.bottom;anchors.bottomMargin: 7
            MouseArea
            {
                anchors.fill: parent
                onPressed: parent.source = "image/nextchange.png"
                onReleased:
                {
                    parent.source = "image/next.png"
//                    if(visual.contentX > 620)
//                        visual.contentX = -310
                    console.log(visual.contentX+=310)
                }
            }
        }
        Image
        { id: auto; source: "image/auto.png" ;width: 20;height: 13;  anchors.bottom: play.bottom;anchors.bottomMargin: 7
            MouseArea
            {
                anchors.fill: parent
                onPressed: parent.source = "image/autochange.png"
                onReleased: parent.source = "image/auto.png"
            }
        }
        Image
        { id: repeat; source: "image/rt.png";width: 20;height: 13; anchors.bottom: play.bottom;anchors.bottomMargin: 7

            MouseArea
            {
                id:repeat_mouse
                anchors.fill: parent
                onClicked:
                {
                    if(i_acc == false)
                    {
                        i_acc = true
                        repeat.source = "image/rtc.png"
                        timer_for_repeat_image.start()
                    }
                    else
                    {
                        i_acc = false
                        repeat.source = "image/rt.png"
                        timer_for_repeat_image.stop()
                    }
                }
            }
        }
        Timer
        {
            id:timer_for_repeat_image
            interval:1500;  repeat:true;  running: false;
            onTriggered:
            {
                if( 0 <= visual.contentX <= 620 &&isup == false )
                {
                    visual.contentX +=310
                    if(visual.contentX ==930)
                        isup = true
                }
                else if(isup == true)
                {
                    visual.contentX -=310
                    if(visual.contentX ==0)
                        isup = false
                }
            }
        }
        Image { id: heart; source: "image/heart.png";width: 20;height: 13;  anchors.bottom: play.bottom;anchors.bottomMargin: 7 }
    }
}

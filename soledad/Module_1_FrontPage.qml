import QtQuick 1.0
Item
{
    visible:lala.width == 800? true:false
    //BackGround
    property bool messageShow: false
    Image
    {
        id: frontPage_bg; /*width: 740; height: 430;*/
        source: "image/Frontwindowsbg.png"
        anchors.centerIn: parent
        anchors.fill: parent
    }
    //
    Text {
        id: start_text;
        color: "white";font.pointSize: 25;
        anchors{ top:frontPage_bg.top; left:frontPage_bg.left ;topMargin:25; leftMargin: 60 }
        text: qsTr("开始")
    }
    Row
    {
        id:row_1
        spacing: 10;
        anchors{ top:frontPage_bg.top; left:frontPage_bg.left ;topMargin:90; leftMargin: 90 }
        Column
        {
            id:col_1
            spacing: 10
            state:"beforeChange_1";   opacity: 0
            transform: Rotation {id:rotation_1; origin.x: 0; origin.y: 0; axis { x: 0; y: 1; z: 0 } angle: 72 }
            states: [
                State
                {
                    name: "afterChange_1"
                    when: module_1.state == "change"
                    PropertyChanges { target: col_1; opacity: 1 }
                },
                State {
                    name: "beforeChange_1"
                    when:  module_1.state == "still"
                    PropertyChanges { target: col_1; opacity: 0 }
                }
            ]
            transitions:[
                Transition
                {
                    from:"beforeChange_1"; to:"afterChange_1"
                    PropertyAnimation { target: col_1; property: "opacity"; duration: 900 ;easing.type:Easing.OutQuint}
                    SequentialAnimation
                    {
                        PropertyAnimation { from:72; to:-18;target: rotation_1; property: "angle"; duration: 900 ;easing.type:Easing.InBounce}
                        PropertyAnimation { from:-18; to:0; target: rotation_1; property: "angle"; duration: 600 ;easing.type:Easing.OutQuint}
                    }

                }
            ]
            Image
            {
                id:home_button
                source: "image/FrontPageHomebutton.png"
                width: 100;height: 100
                MouseArea { anchors.fill: parent;   onClicked: module_1.state = "still"; }
            }
            Image {
                id: door; width: 100; height: 100
                source: ssr.getDoor()===true?"image/dor.png":"image/dorc.png"
//                MouseArea
//                {
//                    anchors.fill: parent;
//                    onClicked:
//                    {
//                        if(ssr.getDoor()===true)
//                        {
//                            ssr.door = false
//                            door.source = "image/dorc.png"
//                        }
//                        else
//                        {
//                            ssr.door = true
//                            door.source = "image/dor.png"
//                        }
//                    }
//                }
            }
            Image
            {
                 id: window_button; width: 100;height: 100
                 source: "image/FrontPagewindowsbuttonon.png"
                 MouseArea
                 {
                     anchors.fill: parent;
                     onClicked:
                     {
                         if(sensor.getWindow()===true)
                         {
                             ssr.window = false
                             window_button.source = "image/FrontPagewindowsbuttonoff.png"
                         }
                         else
                         {
                             ssr.window = true
                             window_button.source = "image/FrontPagewindowsbuttonon.png"
                         }
                     }
                 }
            }   
        }
        Column
        {
            id:col_2
            spacing: 10
            state:"beforeChange_2";   opacity: 0
            transform: Rotation {id:rotation_2; origin.x: -110; origin.y: -50; axis { x: 0; y: 1; z: 0 } angle: 72 }
            states: [
                State
                {
                    name: "afterChange_2"
                    when: module_1.state == "change"
                    PropertyChanges { target: col_2; opacity: 1 }
                },
                State {
                    name: "beforeChange_2"
                    when:  module_1.state == "still"
                    PropertyChanges { target: col_2; opacity: 0 }
                }
            ]
            transitions:[
                Transition
                {
                    from:"beforeChange_2"; to:"afterChange_2"
                    PropertyAnimation { target: col_2; property: "opacity"; duration: 1000 ;easing.type:Easing.InQuart}
                    SequentialAnimation
                    {
                        PropertyAnimation { from:72; to:-18; target: rotation_2; property: "angle"; duration: 1000 ;easing.type:Easing.InBounce}
                        PropertyAnimation { from:-18; to:0; target: rotation_2; property: "angle"; duration: 600 ;easing.type:Easing.OutQuint}
                    }
                }
            ]
            Image {
                id: airConditionig; width: 200;height: 100
                source: "image/FrontPageairbuttonon.png"
                MouseArea
                {
                    anchors.fill: parent
                    onClicked:
                    {
                        if(ssr.getAirCondition()===true)
                        {
                           ssr.airCondition = false
                           airConditionig.source = "image/FrontPageairoff.png"
                        }
                        else
                        {
                            ssr.airCondition = true
                            airConditionig.source = "image/FrontPageairbuttonon.png"
                        }
                    }
                }
            }
            ListView
            {
                id: pic_1_lv; width: 200;height: 100; contentWidth: 200;contentHeight: 300
                clip:true
                Behavior on contentY {NumberAnimation {duration: 1400; easing.type: Easing.OutCirc }}
                model: ListModel
                        {
                            ListElement { picture: "image/FrontPagepic1flash.jpg" }
                            ListElement { picture: "image/frontpagepic.jpg"}
                            ListElement { picture: "image/FrontPagepic12.jpg" }
                        }
                delegate: Image { height: 100; width: 200;  id: pic_1;  source: picture }

            }
        ListView
        {
            id: pic_2_lv; width: 200;height: 100; contentWidth: 200;contentHeight: 300
            clip:true
            Behavior on contentY {NumberAnimation {duration: 1650; easing.type: Easing.OutCirc }}
            model: ListModel
                    {
                        ListElement { picture: "image/FrontPagepic20.jpg" }
                        ListElement { picture: "image/FrontPagepic21.jpg"}
                        ListElement { picture: "image/FrontPagepic22.jpg" }
                    }
            delegate: Image { height: 100; width: 200;  id: pic_2;  source: picture }

        }
        }
        Column
        {
            id:col_3
            spacing: 10
            state:"beforeChange_3";   opacity: 0
            transform: Rotation {id:rotation_3; origin.x: -320; origin.y: -100; axis { x: 0; y: 1; z: 0 } angle: 72 }
            states: [
                State
                {
                    name: "afterChange_3"
                    when: module_1.state == "change"
                    PropertyChanges { target: col_3; opacity: 1 }
                },
                State {
                    name: "beforeChange_3"
                    when:  module_1.state == "still"
                    PropertyChanges { target: col_3; opacity: 0 }
                }
            ]
            transitions:[
                Transition
                {
                    from:"beforeChange_3"; to:"afterChange_3"
                    PropertyAnimation { target: col_3; property: "opacity"; duration: 1100 ;easing.type:Easing.InQuart}
                    SequentialAnimation
                    {
                        PropertyAnimation { from:72; to:-18; target: rotation_3; property: "angle"; duration: 1100 ;easing.type:Easing.InBounce}
                        PropertyAnimation { from:-18; to:0; target: rotation_3; property: "angle"; duration: 600 ;easing.type:Easing.OutQuint}
                    }
                }
            ]
            Image {
                id: computer;  width: 200;height: 100
                source: "image/com.png"
                MouseArea
                {
                    anchors.fill: parent
                    onClicked:
                    {
                        if(ssr.getComputer()===true)
                        {
                            ssr.computer = false
                            computer.source = "image/comf.png"
                        }
                        else
                        {
                            ssr.computer = true
                            computer.source = "image/com.png"
                        }
                    }
                }
            }
            Image {
                id: projector;  width: 200; height: 100;
                source: "image/pro.png"
                MouseArea
                {
                    anchors.fill: parent
                    onClicked:
                    {
                        if(ssr.getProjector()===true)
                        {
                            ssr.projector = false
                            projector.source = "image/prof.png"
                        }
                        else
                        {
                            ssr.projector = true
                            projector.source = "image/pro.png"
                        }
                    }
                }
            }
            Image {
                id: light; width: 200;height: 100;
                source: "image/FrontPagelightoff.png"
                MouseArea
                {
                    id:light_mouseArea
                    anchors.fill: parent
                    onClicked:
                    {
                        if(ssr.getLightState() === true)
                        {
                            ssr.lightState = false;
                            light.source = "image/FrontPagelightoff.png"
                        }
                        else
                        {
                            ssr.lightState = true
                            light.source = "image/FrontPagelighton.png"
                        }
                    }
                }
            }
        }
        Column
        {
            id:col_4
            spacing: 10
            state:"beforeChange_4";   opacity: 0
            transform: Rotation { id:rotation_4; origin.x: -430; origin.y: -150; axis { x: 0; y: 1; z: 0 } }
            states: [
                State
                {
                    name: "afterChange_4"
                    when: module_1.state == "change"
                    PropertyChanges { target: col_4; opacity: 1 }
                },
                State {
                    name: "beforeChange_4"
                    when:  module_1.state == "still"
                    PropertyChanges { target: col_4; opacity: 0 }
                }
            ]
            transitions:[
                Transition
                {
                    from:"beforeChange_4"; to:"afterChange_4"
                    PropertyAnimation { target: col_4; property: "opacity"; duration: 1150 ;easing.type:Easing.InQuart}
                    SequentialAnimation
                    {
                        PropertyAnimation { from:72; to:-20; target: rotation_4; property: "angle"; duration:1150;easing.type:Easing.InBounce }
                        PropertyAnimation { from:-20; to:0; target: rotation_4; property: "angle"; duration: 600 ;easing.type:Easing.OutQuint}
                    }
                }
            ]
            Image {
                id: power; width: 100;height: 100
                source: "image/po.png"
                MouseArea
                {
                    anchors.fill: parent
                    onClicked:
                    {
                        if(ssr.getPower() === true)
                        {
                            ssr.power = false
                            power.source = "image/pof.png"
                        }
                        else
                        {
                            ssr.power = true
                            power.source = "image/po.png"
                        }
                    }
                }
            }
            ListView
            {
                id: pic_3_lv; width: 100;height: 100; contentWidth: 200;contentHeight: 300
                clip:true  ; contentY:0; contentX:0
                Behavior on contentY {NumberAnimation {duration: 1800; easing.type: Easing.OutCirc }}
                model: ListModel
                        {
                            ListElement { picture: "image/FrontPagepic30.jpg" }
                            ListElement { picture: "image/FrontPagepic31.jpg"}
                            ListElement { picture: "image/FrontPagepic32.jpg" }
                        }
                delegate: Image { height: 100; width: 100;  id: pic_3;  source: picture }

            }
            Image {
                id: send_message; width: 100;height: 100;
                source: "image/fpm.png"
                MouseArea
                {
                    id:send_message_mouse
                    anchors.fill: parent
                    onPressed: send_message.source = "image/FrontPagesendMessagerelease.png"
                    onReleased:
                    {
                        send_message.source = "image/fpm.png"
                        messageShow = true
                    }
                }
            }
        }
    }
    Module_1_FrontPage_Message { id:send_Message; height: parent.height; width: 200 ;}
        states: [
        State {
            name: "send_Message_show"
            when: messageShow == true
            PropertyChanges {  target: send_Message ; x:  600}
            PropertyChanges {  target: shade; opacity: 0.5 }
            PropertyChanges {  target: shade; width:600}
            PropertyChanges {  target: row_1; x:-130}
            PropertyChanges {  target: row_1; enabled:false}
        },
        State {
            name: "send_Message_disappear"
            when: messageShow != true
            PropertyChanges {  target: send_Message ; x:  800}
            PropertyChanges {  target: shade; opacity: 0 }
            PropertyChanges {  target: shade; width:800}
            PropertyChanges {  target: row_1; focus:true}
        }
        ]
        transitions: Transition {
            ParallelAnimation
            {
                NumberAnimation {target: send_Message; property: "x"; duration: 600; easing.type: Easing.OutQuint }
                NumberAnimation {target: shade; properties: "opacity,width"; duration: 600; easing.type: Easing.OutQuint }
            }
        }
        Rectangle {
            id: shade
            color: "black";height: 480
            opacity: 0
            Rectangle{anchors.fill: parent; border.color: "black"; color: "transparent"}
        }
    //Timer~
    Timer
        {
            property bool pic3_turn: false
            id:timer_for_repeat_image
            interval:2900;  repeat:true;  running:rotation_4.angle ==0? true:false ;
            onTriggered:
            {
                if( 0 <= pic_3_lv.contentY < 100 && pic3_turn == false )
                {
                    pic_3_lv.contentY +=100
                    if(pic_3_lv.contentY == 100)
                        pic3_turn = true
                }
                else if(pic3_turn == true)
                {
                    pic_3_lv.contentY -= 100
                    if(pic_3_lv.contentY ==100)
                        pic3_turn = false
                }
            }
        }
        Timer
            {
                property bool pic2_turn: false
                id:timer_for_repeat_image_2
                interval:3100;  repeat:true;  running:rotation_2.angle ==0? true:false ;
                onTriggered:
                {
                    if( 0 <= pic_2_lv.contentY < 100 && pic2_turn == false )
                    {
                        pic_2_lv.contentY +=100
                        if(pic_2_lv.contentY == 100)
                            pic2_turn = true
                    }
                    else if(pic2_turn == true)
                    {
                        pic_2_lv.contentY -= 100
                        if(pic_2_lv.contentY ==100)
                            pic2_turn = false
                    }
                }
            }
        Timer
            {
                property bool pic1_turn: false
                id:timer_for_repeat_image_1
                interval:3600;  repeat:true;  running:rotation_2.angle ==0? true:false ;
                onTriggered:
                {
                    if( 0 <= pic_1_lv.contentY < 100 && pic1_turn == false )
                    {
                        pic_1_lv.contentY += 100
                        if(pic_1_lv.contentY == 100)
                            pic1_turn = true
                    }
                    else if(pic1_turn == true)
                    {
                        pic_1_lv.contentY -= 100
                        if(pic_1_lv.contentY == 100)
                            pic1_turn = false
                    }
                }
            }


}


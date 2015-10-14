import QtQuick 1.0
//import "image"
Rectangle
{
    //
    //      this Model is For Environment Information Collection
    //
    color: "transparent"
    property bool countor_1: false
    property int animationForLogIn_on: 1
    Image
    {
        id: module_image_0
        height: parent.height; width: parent.width*1/4
        source: "image/molb.jpg"
        Column
        {
            width: parent.width; height: parent.height
            Image
            {
                width: parent.width;height: parent.height*1/10
                source: "image/rectangle.png"
                Text {
                    id: rfid_text;anchors.centerIn: parent
                    text: qsTr("RFID");font.family: "Courier";color: "white"
                }

            }
            Image
            {
                id: rfid_exit; width: parent.width;height: parent.height*1/10
                source: ""
                Text {
                    id: rfid_exit_text;anchors.centerIn: parent
                    text: qsTr("Home");font.family: "Courier";color: "white"
                }
                MouseArea
                {
                    id:home_button
                    anchors.fill: parent
                    hoverEnabled: true; enabled: module_0.width == 800? true:false
                    //propagateComposedEvents: true
                    onEntered: rfid_exit.source = "image/module0tag0.jpg"
                    onExited: rfid_exit.source = ""
                    onClicked:
                    {
                        login.visible = false
                        rfid_log_mouse.enabled = true
                        animationForLogIn_on = 1
                        if(countor_1 == true)
                            countor_1 = false
                    }
                }
            }
            Image
            {
                id: rfid_login_image; width: parent.width;height: parent.height*1/10
                source: ""
                Text {
                    id: rfid_login;anchors.centerIn: parent
                    text: qsTr("Login");font.family: "Courier";color: "white"
                }
                MouseArea
                {
                    id:rfid_log_mouse
                    anchors.fill: parent
                    hoverEnabled: true;enabled: module_0.width == 800? true:false
                    //propagateComposedEvents: true
                    //propagateComposedEvents: true
                    onEntered: rfid_login_image.source = "image/module0tag0.jpg"
                    onExited: rfid_login_image.source = ""
                    onClicked:
                    {
                        login.visible = true
                        animationForLogIn_on = 2
                    }
                }
            }
            Image
            {
                id: rfid_show_info; width: parent.width;height: parent.height*1/10
                source: animationForLogIn_on == 3 ?"image/module0tag0.jpg":""
                Text {
                    id: rfid_info;anchors.centerIn: parent
                    text: qsTr("Info");font.family: "Courier";color: "white"
                }
                MouseArea
                {
                    anchors.fill: parent
                    hoverEnabled: true;enabled: module_0.width == 800? true:false
                    //propagateComposedEvents: true
                    onEntered: rfid_show_info.source = "image/module0tag0.jpg"
                    onExited: rfid_show_info.source = ""
                    onClicked:
                    {
                      //  login.active = true
                    }
                }
            }
            Image
            {
                id: rfid_modify_info; width: parent.width;height: parent.height*1/10
                source: ""
                Text {
                    id: rfid_modify;anchors.centerIn: parent
                    text: qsTr("Update");font.family: "Courier";color: "white"
                }
                MouseArea
                {
                    anchors.fill: parent
                    hoverEnabled: true;enabled: module_0.width == 800? true:false
                   // propagateComposedEvents: true
                    onEntered: rfid_modify_info.source = "image/module0tag0.jpg"
                    onExited: rfid_modify_info.source = ""
                    onClicked:
                    {
                      //  login.active = true
                        animationForLogIn_on = 4
                        rfidData.show();
                    }
                }
            }
        }
    }
    //RightSide
    Image
    {
        id: module_image_right;anchors.left: module_image_0.right
        height: parent.height; width: parent.width*3/4
        source: "image/module0rightsidebg.png"
        Image {
            id: top_image_of_right;width: parent.width;height: parent.height*1/10
            source: "image/modt.png"
            Text {
                id: top_image_of_right_title;anchors.left: parent.left;anchors.leftMargin: 20;
                anchors.verticalCenter: parent.verticalCenter;
                text: qsTr("RFID Car Management System");font.family: "Courier";color: "white"
            }
        }
        //加载 module_0登陆，rfid等功能界面
        //
        //
//        Loader
//        {
//            id:login
//            source: "Module_0_Functions.qml";width: parent.width*4/5; height: parent.height*3/5
//            anchors {verticalCenter: parent.verticalCenter;horizontalCenter: parent.horizontalCenter;verticalCenterOffset: 23}
//            active:false
//        }
        Module_0_Functions
        {
            id:login ;  width: parent.width*4/5; height: parent.height*3/5
         //   anchors {verticalCenter: parent.verticalCenter;horizontalCenter: parent.horizontalCenter;verticalCenterOffset: 23}
            visible: false; x:60;y:120
        }
    }
    MouseArea
    {
        id:module_0_mouseArea
        anchors.fill: parent;z:-1
       // hoverEnabled: true
        //propagateComposedEvents: true
       // onEntered: module_image_0.source = "image/aaaaa.png"
       // onExited: module_image_0.source = "image/bbbbb.png"
//        onPressed:
//        {
//            module_image_0.source = "image/bbbbb.png"
//        }
        onClicked:
        {
           // module_image_0.source = "image/aaaaa.png"
            if(countor_1 == false)
            {
                countor_1 = true
            }
            else
            {
                 /*  通过countor来控制窗口
                  *
                  */
            }
           // animateOpacity.start()
        }
        states:
            [
            State
            {
                name: "module_expand_0"
                when: countor_1 == true
                PropertyChanges { target: module_0; x:0; y:0;  width:800;  height:480 }
                PropertyChanges { target: module_1; visible:false}
                PropertyChanges { target: module_2; visible:false}
                PropertyChanges { target: clock_text; visible:false}
                PropertyChanges { target: title; visible:false}
                PropertyChanges { target: pic; visible:false}
                PropertyChanges { target: rfid_login; font.pixelSize:19}
                PropertyChanges { target: rfid_exit_text; font.pixelSize:19}
                PropertyChanges { target: top_image_of_right_title; font.pixelSize:19;visible:true}
                PropertyChanges { target: rfid_text; font.pixelSize:19}
                PropertyChanges { target: rfid_info; font.pixelSize:19;text:"Information"}
                PropertyChanges { target: rfid_modify; font.pixelSize:19}
            },
            State
            {
                name: "module_expand_1"
                when: countor_1 == false
                PropertyChanges { target: module_0; x:48; y:145; width: 230; height: 290  }
                PropertyChanges { target: module_1; visible:true}
                PropertyChanges { target: module_2; visible:true}
                PropertyChanges { target: clock_text; visible:true}
                PropertyChanges { target: title; visible:true}
                PropertyChanges { target: pic; visible:true}
                PropertyChanges { target: rfid_login; font.pixelSize:12}
                PropertyChanges { target: rfid_exit_text; font.pixelSize:12}
                PropertyChanges { target: top_image_of_right_title; font.pixelSize:12;visible:false}
                PropertyChanges { target: rfid_text; font.pixelSize:12}
                PropertyChanges { target: rfid_info; font.pixelSize:12}
                PropertyChanges { target: rfid_modify; font.pixelSize:12}
            }
        ]
        transitions:
            [
            Transition
            {
                from: "module_expand_1" ; to: "module_expand_0"
                PropertyAnimation {  target: module_0; properties: "x,y,width,height"; duration: 450;  easing.type: Easing.OutQuint   }
                PropertyAnimation {  targets: [rfid_login,rfid_exit_text,rfid_text];  property: "font.pixelSize"; duration: 450;  easing.type: Easing.OutCirc  }
            },
            Transition
            {
                from: "module_expand_0";  to: "module_expand_1"
                PropertyAnimation  {  target: module_0;  properties: "x,y,width,height"; duration: 450;  easing.type: Easing.OutQuint  }
                PropertyAnimation  {  targets: [rfid_login,rfid_exit_text,top_image_of_right_title,rfid_text];  property: "font.pixelSize,visiable"; duration: 450;  easing.type: Easing.OutCirc  }
            }
        ]

    }
}

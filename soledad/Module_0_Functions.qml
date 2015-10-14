import QtQuick 1.0
Flickable
{
    id:flick
 //   property bool logInFlag: false
    contentHeight:height;contentWidth:width
    flickableDirection: Flickable.HorizontalFlick
   // clip:true; interactive: false
    property int information_flag: 1
//    Rectangle
//    {
//        anchors.fill: parent;color: "transparent";border.color: "red"
//    }
    //   Function 1  login
    Item
    {
        id: login_item
        width: flick.width;height: flick.height
        Image { id: login_bg; source: "image/login.jpg";width: flick.width;height: flick.height; }
        Column
        {
            anchors.centerIn: login_bg
            spacing: 20
            Item
            {
                width: input_name.width;height: 40
                TextEdit
                {
                    id:input_name_text
                    text:"Name";font.pixelSize: 16;
                    width: input_name.width;height: 25
                    color: "grey"; font.family: "Courier"
                }
                Image {
                    id: input_name;anchors.top:input_name_text.bottom
                    source: "image/Inputname.png"
                }
            }
            Item
            {
                width: input_name.width;height: 40
                TextEdit
                {
                    id:input_password_text
                    text:"Password";font.pixelSize: 16;
                    width: input_name.width;height: 25
                    color: "grey"; font.family: "Courier"
                }
                Image {
                    id: input_password; anchors.top: input_password_text.bottom
                    source: "image/Inputpassword.png"
                }
            }
            Row
            {
                spacing: 60
                Image
                {
                    id: button_comfirm;  width: 118;height: 42
                    source: "image/LogInbutton.png"
                    MouseArea
                    {
                        anchors.fill: parent
                        onPressed: button_comfirm.source = "image/LogInbuttonpressed.png"
                        onReleased:
                        {
                             //console.log(logInFlag)
                            button_comfirm.source = "image/LogInbutton.png"
                            loginClass.userName = input_name_text.text
                            loginClass.passWord = input_password_text.text
                            if(loginClass.log_In()=== true)
                            {
                                animationForLogIn_on=3
                            }
                            else
                            {
                                console.log("Wrong Username or Password")
                            }
                            rfid_log_mouse.enabled = false
//                            }
                        }
                    }
                }
                Image
                {
                    id: button_cancel;  width: 118;height: 42
                    source: "image/loginconfirm.png"
                    MouseArea
                    {
                        anchors.fill: parent
                        onPressed: button_cancel.source = "image/LogInbottonconfirmpressed.png"
                        onReleased:
                        {
                            button_cancel.source = "image/loginconfirm.png"
                        }
                    }
                }
            }
        }
       // state: "before"
        states:
            [
            State
            {
                name: "before"
                when:animationForLogIn_on == 1
                PropertyChanges { target: login_bg; x:-flick.width;opacity:0}
                PropertyChanges { target: input_name_text; x:-flick.width;opacity:0}
                PropertyChanges { target: input_name; x:-flick.width;opacity:0}
                PropertyChanges { target: input_password; x:-flick.width;opacity:0}
                PropertyChanges { target: input_password_text; x:-flick.width;opacity:0}
                PropertyChanges { target: button_comfirm; x:-flick.width;opacity:0}
                PropertyChanges { target: button_cancel; x:-flick.width;opacity:0}
            },
            State
            {
                name: "after"
                when:animationForLogIn_on == 2
                PropertyChanges {target: login_bg; x:0;  opacity:1}
                PropertyChanges { target: input_name_text; x:0; opacity:1}
                PropertyChanges { target: input_name; x:0;  opacity:1}
                PropertyChanges { target: input_password; x:0; opacity:1}
                PropertyChanges { target: input_password_text; x:0;  opacity:1}
                PropertyChanges { target: button_comfirm; x:0;  opacity:1}
                PropertyChanges { target: button_cancel; x:190;  opacity:1}
               // PropertyChanges { target: information; x:2*flick.width ;  opacity:0}
            },
            State
            {
                name: "disappear"
                when: animationForLogIn_on == 3
                PropertyChanges { target: login_bg; x:flick.width;  opacity:0}
                PropertyChanges { target: input_name_text; x:flick.width; opacity:0}
                PropertyChanges { target: input_name; x:flick.width;  opacity:0}
                PropertyChanges { target: input_password; x:flick.width; opacity:0}
                PropertyChanges { target: input_password_text; x:flick.width;  opacity:0}
                PropertyChanges { target: button_comfirm; x:flick.width;  opacity:0}
                PropertyChanges { target: button_cancel; x:flick.width+190;  opacity:0}
                //info property
                PropertyChanges { target: information_bg; x:0;  opacity:1}
                PropertyChanges { target: user_info; x:0;  opacity:1}
                PropertyChanges { target: user_info_line; x:0;  opacity:1}
                PropertyChanges { target: cardNumber; x:0;  opacity:1}
                PropertyChanges { target: cardNumber_line; x:0;  opacity:1}
                PropertyChanges { target: enterTime; x:0;  opacity:1}
                PropertyChanges { target: enterTime_line; x:0;  opacity:1}
                PropertyChanges { target: leaveTime; x:0;  opacity:1}
                PropertyChanges { target: leaveTime_line; x:0;  opacity:1}
            }
        ]
        transitions:
            [
            Transition
            {
                from:"before"; to: "after";
                NumberAnimation { target: login_bg;  properties: "x,opacity"; duration: 600 ;easing.type: Easing.OutQuint  }
                NumberAnimation { target: input_name_text;  properties: "x,opacity"; duration: 750 ;easing.type: Easing.OutQuint  }
                NumberAnimation { target: input_name;  properties: "x,opacity"; duration: 900 ;easing.type: Easing.OutQuint  }
                NumberAnimation { target: input_password;  properties: "x,opacity"; duration: 1200 ;easing.type: Easing.OutQuint  }
                NumberAnimation { target: input_password_text;  properties: "x,opacity"; duration: 1050 ;easing.type: Easing.OutQuint  }
                NumberAnimation { target: button_comfirm;  properties: "x,opacity"; duration: 1600 ;easing.type: Easing.OutQuint  }
                NumberAnimation { target: button_cancel;  properties: "x,opacity"; duration: 1350 ;easing.type: Easing.OutQuint  }
            },
            Transition
            {
                from:"after"; to: "disappear";
                NumberAnimation { target: login_bg;  properties: "x,opacity"; duration: 1350 ;easing.type: Easing.OutQuint  }
                NumberAnimation { target: input_name_text;  properties: "x,opacity"; duration: 750 ;easing.type: Easing.OutQuint  }
                NumberAnimation { target: input_name;  properties: "x,opacity"; duration: 900 ;easing.type: Easing.OutQuint  }
                NumberAnimation { target: input_password;  properties: "x,opacity"; duration: 1200 ;easing.type: Easing.OutQuint  }
                NumberAnimation { target: input_password_text;  properties: "x,opacity"; duration: 1050 ;easing.type: Easing.OutQuint  }
                NumberAnimation { target: button_comfirm;  properties: "x,opacity"; duration: 1600 ;easing.type: Easing.OutQuint  }
                NumberAnimation { target: button_cancel;  properties: "x,opacity"; duration: 1350 ;easing.type: Easing.OutQuint  }
                //
                NumberAnimation { target: information_bg;  properties: "x,opacity"; duration: 750 ;easing.type: Easing.OutQuint  }
                NumberAnimation { target: user_info;  properties: "x,opacity"; duration: 900 ;easing.type: Easing.OutQuint  }
                NumberAnimation { target: user_info_line;  properties: "x,opacity"; duration: 1050 ;easing.type: Easing.OutQuint  }
                NumberAnimation { target: cardNumber;  properties: "x,opacity"; duration: 1200 ;easing.type: Easing.OutQuint  }
                NumberAnimation { target: cardNumber_line;  properties: "x,opacity"; duration: 1350 ;easing.type: Easing.OutQuint  }
                NumberAnimation { target: enterTime;  properties: "x,opacity"; duration: 1500 ;easing.type: Easing.OutQuint  }
                NumberAnimation { target: enterTime_line;  properties: "x,opacity"; duration: 1650 ;easing.type: Easing.OutQuint  }
                NumberAnimation { target: leaveTime;  properties: "x,opacity"; duration: 1750 ;easing.type: Easing.OutQuint  }
                NumberAnimation { target: leaveTime_line;  properties: "x,opacity"; duration: 1850 ;easing.type: Easing.OutQuint  }
            }
        ]
    }
    // information
    Item
    {
        id: information
        width: flick.width;height: flick.height
        Image { id: information_bg; source: "image/login.jpg";width: flick.width;height: flick.height;x:2*flick.width ;  opacity:0 }
        Column
        {
            anchors.centerIn: parent
            spacing: 20
            Item
            {
                width: user_info_line.width;height: 40
                TextEdit
                {
                    id:user_info
                    text:"UserName:"
                    font.pixelSize: 16;
                    width: user_info_line.width;height: 25
                    color: "grey"; font.family: "Courier"
                    x:2*flick.width ;  opacity:0
                }
                Image {
                    id: user_info_line;anchors.top:user_info.bottom
                    source: "image/Inputpassword.png"
                    x:2*flick.width ;  opacity:0
                }
            }
            Item
            {
                width: user_info_line.width;height: 40
                TextEdit
                {
                    id:cardNumber
                    text:"Card Number:"+rfid.rfidCard
                    font.pixelSize: 16;x:2*flick.width ;  opacity:0
                    width: user_info_line.width;height: 25
                    color: "grey"; font.family: "Courier"
                }
                Image {
                    id: cardNumber_line; anchors.top: cardNumber.bottom
                    source: "image/Inputpassword.png"
                    x:2*flick.width ;  opacity:0
                }
            }
            Item
            {
                width: user_info_line.width;height: 40
                TextEdit
                {
                    id:enterTime
                    text:"Car:"
                    font.pixelSize: 16;x:2*flick.width ;  opacity:0
                    width: user_info_line.width;height: 25
                    color: "grey"; font.family: "Courier"
                }
                Image {
                    id: enterTime_line;anchors.top:enterTime.bottom
                    source: "image/Inputpassword.png"
                    x:2*flick.width ;  opacity:0
                }
            }
            Item
            {
                width: user_info_line.width;height: 40
                TextEdit
                {
                    id:leaveTime
                    text:"Location:"
                    font.pixelSize: 16;x:2*flick.width ;  opacity:0
                    width: user_info_line.width;height: 25
                    color: "grey"; font.family: "Courier"
                }
                Image {
                    id: leaveTime_line;anchors.top:leaveTime.bottom
                    source: "image/Inputpassword.png"
                    x:2*flick.width ;  opacity:0
                }
            }
        }
    }
    Item
    {
        id:update
        width: flick.width;height: flick.height
        Image { id: update_bg; source: "image/login.jpg";width: flick.width;height: flick.height;/*x:2*flick.width ;  opacity:0 */}
 //       state: "notshow"
        states:
            [
            State
            {
                name: "notshow"
                when: animationForLogIn_on != 4
                PropertyChanges { target: update; x:2*flick.width;opacity:0}
//                PropertyChanges { target: input_name_text; x:-flick.width;opacity:0}
//                PropertyChanges { target: input_name; x:-flick.width;opacity:0}
//                PropertyChanges { target: input_password; x:-flick.width;opacity:0}
//                PropertyChanges { target: input_password_text; x:-flick.width;opacity:0}
//                PropertyChanges { target: button_comfirm; x:-flick.width;opacity:0}
//                PropertyChanges { target: button_cancel; x:-flick.width;opacity:0}
            },
            State
            {
                name: "show"
                when:animationForLogIn_on == 4
                PropertyChanges {target: update; x:0;  opacity:1}
                PropertyChanges {target: login_item; visible:false}
//                PropertyChanges { target: input_name_text; x:0; opacity:1}
//                PropertyChanges { target: input_name; x:0;  opacity:1}
//                PropertyChanges { target: input_password; x:0; opacity:1}
//                PropertyChanges { target: input_password_text; x:0;  opacity:1}
//                PropertyChanges { target: button_comfirm; x:0;  opacity:1}
//                PropertyChanges { target: button_cancel; x:190;  opacity:1}
               // PropertyChanges { target: information; x:2*flick.width ;  opacity:0}
            }

        ]
        transitions:
            [
            Transition
            {
                from: "notshow";to: "show"
                NumberAnimation { target: update;  properties: "x,opacity"; duration: 750 ;easing.type: Easing.OutQuint  }
            },
            Transition
            {
                from: "show";to: "notshow"
                NumberAnimation { target: update;  properties: "x,opacity"; duration: 750 ;easing.type: Easing.OutQuint  }
            }

        ]
//        Column
//        {
//            anchors.centerIn: parent
//            spacing: 20
//            Item
//            {
//                width: input_name.width;height: 40
//                TextEdit
//                {
//                    id:input_name_text
//                    text:"Name";font.pixelSize: 16;
//                    width: input_name.width;height: 25
//                    color: "grey"; font.family: "Courier"
//                }
//                Image {
//                    id: input_name;anchors.top:input_name_text.bottom
//                    source: "image/Input_name.png"
//                }
//            }
//            Item
//            {
//                width: input_name.width;height: 40
//                TextEdit
//                {
//                    id:input_password_text
//                    text:"Password";font.pixelSize: 16;
//                    width: input_name.width;height: 25
//                    color: "grey"; font.family: "Courier"
//                }
//                Image {
//                    id: input_password; anchors.top: input_password_text.bottom
//                    source: "image/Input_password.png"
//                }
//            }
//            Row
//            {
//                spacing: 60
//                Image
//                {
//                    id: button_comfirm;  width: 118;height: 42
//                    source: "image/LogIn_button.png"
//                    MouseArea
//                    {
//                        anchors.fill: parent
//                        onPressed: button_comfirm.source = "image/LogIn_button_pressed.png"
//                        onReleased:
//                        {
//                            button_comfirm.source = "image/LogIn_button.png"
//                        }
//                    }
//                }
//                Image
//                {
//                    id: button_cancel;  width: 118;height: 42
//                    source: "image/LogIn_button_Confirm.png"
//                    MouseArea
//                    {
//                        anchors.fill: parent
//                        onPressed: button_cancel.source = "image/LogIn_botton_confirm_pressed.png"
//                        onReleased:
//                        {
//                            button_cancel.source = "image/LogIn_button_Confirm.png"
//                        }
//                    }
//                }
//            }
//        }
    }

}


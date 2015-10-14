import QtQuick 1.0
Item
{
    width: 500;  height: 90;  x:30;   y:30
    property bool function_count: false
    Image {
        id: title_back;anchors.left: parent.left;  anchors.leftMargin: 15; anchors.top:parent.top; anchors.topMargin: 7;
        width: 460;height: 85;
        source: "image/module0rightsidebg.png"
    }
        //
        //                          Profile
        Item
        {
            id:rec_profile;  width: 105;  height: 50;  x:35;  y:22
            state:"profile_still"
            Image
            {
                id: profile_image_0
                anchors.fill: parent          
                source: "image/item.png"
                Text
                {
                    id: profile_text
                    anchors.centerIn: parent;  font.pixelSize: 15;  color: "white";font.family: "Courier"
                }
            }
            MouseArea
            {
                id:profile_mouseArea_first
                hoverEnabled: true
             //   propagateComposedEvents: true
                anchors.fill: rec_profile
                onClicked:
                {
                    if(rec_profile.state == "profile_still")
                        rec_profile.state = "profile_change"
                    else
                        rec_profile.state = "profile_still"
                }
            }
            states: [
                State {
                    name: "profile_still"
                    PropertyChanges { target: rec_profile; width:105;}
                    PropertyChanges {  target: rec_function; visible:true; }
                    PropertyChanges {  target: rec_aboutMe; visible:true; }
                    PropertyChanges {  target: rec_contact; visible:true; }
                    PropertyChanges {  target: profile_text; text:qsTr("Profile"); }
                    PropertyChanges {  target: profile_image_0; source:"image/item.png"; }
                },
                State
                {
                    name: "profile_change"
                    PropertyChanges {  target: rec_profile; width:425; }
                    PropertyChanges {  target: rec_function; visible:false; }
                    PropertyChanges {  target: rec_aboutMe; visible:false; }
                    PropertyChanges {  target: rec_contact; visible:false; }
                    PropertyChanges {  target: profile_text; text:qsTr("Campus Environment Monitoring System"); }
                    PropertyChanges {  target: profile_image_0; source:"image/titlebackground2.png"; }
                }

            ]
            transitions: [
                Transition {
                    from: "profile_still"
                    to: "profile_change"
                    PropertyAnimation { target: rec_profile; property: "width";duration: 300; easing.type:Easing.OutQuint }
                },
                Transition {
                    from: "profile_change"
                    to: "profile_still"
                    PropertyAnimation { target: rec_profile; property: "width";duration: 200; easing.type:Easing.OutQuint }
                    PropertyAnimation { target: profile_text; property: "text";duration: 1 }
                }
            ]

        }
        //
        //                          Function
        Item
        {
            id:rec_function;   width: 105;   height: 50;   anchors.left: rec_profile.right
            anchors.top: rec_profile.top ;  z:1
            Image
            {
                id: rec_function_image_0
                anchors.fill: parent
                source: "image/item.png"
                Text
                {
                    id: text_function; anchors.centerIn: parent;color: "white"
                    text: qsTr("Functions");font.pixelSize: 15;font.family: "Courier"
                }
            }
            MouseArea
            {
                anchors.fill: rec_function
                hoverEnabled: true
                onPressed:{ rec_function_image_0.source = "image/aaaaa.png";  text_function.color = "grey"  }
                onReleased:
                {
                    rec_function_image_0.source = "image/item.png"
                    text_function.color = "white"
                    if(function_introduction.state == "intro_still")
                        function_introduction.state = "intro_change"
                    else
                        function_introduction.state = "intro_still"
                }
            }
            //
        }
        Item                      //Function Introduction
        {
            id:function_introduction; width: rec_function.width ; height:0;
            anchors{ top:rec_function.bottom; topMargin: 5 ; left:rec_function.left}
            state:"intro_still"
            Column
            {
                anchors.fill: parent
                spacing: 3
                Item
                {
                   width: rec_function.width ; height:function_introduction.height/3;
                   Image
                   {
                       anchors.fill: parent;id: first_selection; source: "image/itemn.png"
                     //  visible: function_introduction.state == "intro_still"?false:true
                       Text {anchors.centerIn: parent; text: qsTr("One");font.pixelSize: 15; color: "white";font.family: "Courier"
                           visible: function_introduction.state == "intro_still"?false:true
                       }
                   }
                }
                Item
                {
                   width: rec_function.width ; height:function_introduction.height/3;
                   Image
                   {
                       anchors.fill: parent;id: second_selection; source: "image/item.png"
                     //  visible: function_introduction.state == "intro_still"?false:true
                       Text {anchors.centerIn: parent; text: qsTr("Two");font.pixelSize: 15; color: "white";font.family: "Courier"
                           visible: function_introduction.state == "intro_still"?false:true
                       }
                   }
                }
                Item
                {
                   width: rec_function.width ; height:function_introduction.height/3;
                   Image
                   {
                       anchors.fill: parent;id: third_selection; source: "image/itema.png"
                       Text {anchors.centerIn: parent; text: qsTr("Third");font.pixelSize: 15; color: "white";font.family: "Courier"
                           visible: function_introduction.state == "intro_still"?false:true
                       }
                   }
                }
            }

            states:
                [
                State
                {
                    name: "intro_still"
                    PropertyChanges { target: function_introduction;  height:0  }
                    PropertyChanges { target: module_0;  visible:true }

                },
                State
                {
                    name: "intro_change"
                    PropertyChanges { target: function_introduction; height:rec_function.height*3; }
                    PropertyChanges { target: module_0;  visible:false }
                }
                ]
            transitions: [
                Transition {
                    from: "intro_still"
                    to: "intro_change"
                    PropertyAnimation { target: function_introduction; property: "height";duration: 200; easing.type:Easing.OutQuad }
                },
                Transition {
                    from: "intro_change"
                    to: "intro_still"
                    PropertyAnimation { target: function_introduction; property: "height";duration: 200; easing.type:Easing.InQuad }
                    PropertyAnimation { target: module_0; property: "visible";duration: 200; easing.type:Easing.InQuad }
                }
            ]

        }
        //
        //                           About Me
        Item
        {
            state:"aboutMe_still"
            id:rec_aboutMe
//            x:300; y:rec_function.y; width:105;  height:50;
            Image
            {
                id: rec_aboutMe_image_0;  anchors.fill: parent;   source: "image/item.png"
                Text{ id: aboutMe;  anchors.centerIn: parent;  font.pixelSize: 15;font.family: "Courier";   color: "white"}
            }
            MouseArea
            {

                anchors.fill: parent
                onClicked:
                {
                    if(rec_aboutMe.state == "aboutMe_still")
                        rec_aboutMe.state = "aboutMe_change"
                    else
                        rec_aboutMe.state = "aboutMe_still"
                }
            }
                states:
                    [
                    State
                    {
                        name: "aboutMe_still"
                        PropertyChanges { target: rec_aboutMe; x:243; y:22; width:105;  height:50; }
                        PropertyChanges { target: aboutMe; text: qsTr("About Me")}
                        PropertyChanges { target: module_0; visible:true}
                        PropertyChanges { target: module_1; visible:true}
                    },
                    State
                    {
                        name: "aboutMe_change"
                        PropertyChanges { target: rec_aboutMe; x:0;  y:100 ; width: 500;  height: 150 }
                        PropertyChanges { target: module_0; visible:false}
                        PropertyChanges { target: module_1; visible:false}
                        PropertyChanges { target: aboutMe; text: qsTr("Software is about.........................")}

                    }
                ]
                transitions: [
                    Transition
                    {
                        from: "aboutMe_still";   to: "aboutMe_change"
                        ParallelAnimation
                        {
                            PropertyAnimation { targets:[rec_aboutMe];  properties: "x,y,width,height" ; duration: 200; easing.type: Easing.OutQuad }
                        }
                    },
                    Transition
                    {
                        from: "aboutMe_change";  to: "aboutMe_still"
                        ParallelAnimation
                        {
                           PropertyAnimation { targets:[rec_aboutMe,module_1,module_0]; properties: "x,y,width,height,visible"; duration: 200 ;  easing.type: Easing.OutQuad }
                           PropertyAnimation { target: aboutMe; property: "text";duration: 1 }
                        }
                    }
                ]
        }
        //
        //                           Contact
        Item
        {
            id:rec_contact
            state: "still"
            Image
            {
                id: rec_contact_image_0;  anchors.fill: parent;   source: "image/item.png"
                Text
                {
                    id: rec_contact_text;  anchors.centerIn: parent; font.pixelSize: 15; color: "white";font.family: "Courier"
                }
            }
            MouseArea
            {
                anchors.fill: parent
                onClicked:
                {
                    if(rec_contact.state == "still")
                        rec_contact.state = "change"
                    else
                        rec_contact.state = "still"
                }
            }
            states: [
                State {
                    name: "still"
                    PropertyChanges { target: rec_contact;  x:348;  y:22 ; width: 105;  height: 50  }
                    PropertyChanges { target: rec_contact_text; text: qsTr("Contact") }
                    PropertyChanges { target: module_0; visible:true}
                    PropertyChanges { target: module_1; visible:true}

                },
                State
                {
                    name: "change"
                    PropertyChanges { target: rec_contact;  x:0;  y:100 ; width: 500;  height: 150}
                    PropertyChanges { target: rec_contact_text;font.pixelSize: 12; text: qsTr("    Copyright 2014.12-2015.06 LinLan. All rights reserved.")+"\n"
                                                                      +"                   Major in Internet Of Things (2011-2015) "+"\n"
                                                                      +"    Computer Science and Information Technology Department "+"\n"
                                                                 +qsTr("                 Dalian Neusoft University of information.")+"\n"
                                                                      +"                     Contact with   linlangongzi@live.com" }
                    PropertyChanges { target: module_0; visible:false}
                    PropertyChanges { target: module_1; visible:false}
                }
            ]
            transitions: [
                Transition
                {
                    from: "still";   to: "change"
                    ParallelAnimation
                    {
                        PropertyAnimation { targets:[rec_contact];  properties: "x,y,width,height" ; duration: 200; easing.type: Easing.OutQuad }
                    }
                },
                Transition
                {
                    from: "change";  to: "still"
                    ParallelAnimation
                    {
                       PropertyAnimation { targets:[rec_contact,module_1,module_0]; properties: "x,y,width,height,visible"; duration: 200 ;  easing.type: Easing.OutQuad }
                       PropertyAnimation { target: rec_contact_text; property: "text";duration: 1 }
                    }
                }
            ]
        }
        //
        //

}


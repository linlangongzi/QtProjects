import QtQuick 1.0
Flipable
{
    width: 800
    height: 480
    state:"still" 
    front:
        Item
        {
            id:lala
            width: 210;height: 140;
            anchors.centerIn:parent
            anchors.horizontalCenterOffset:10
            anchors.verticalCenterOffset:-30
            Image { id:module_1_image; source: lala.width==210?"image/aaaaa.png":"image/Frontwindowsbg.png";anchors.fill: parent}
            //
//            Rectangle
//            {
//                anchors.fill: parent
//                color: "transparent"
//                Text {
//                    id: na
//                    anchors.centerIn: parent
//                    text: qsTr("text")+sensor.temperature
//                }
//                Text
//                {
//                    anchors.top: na.bottom
//                    text:qsTr("nima le ")+sensor.getWet()
//                }
//            }

            Module_1_FrontPage
            {
              id:frontPage
              anchors.fill: lala
            }
            //
            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true
                z:-1
                onClicked:
                {
                    if(module_1.state == "still")
                    {
                        module_1.state = "change"
                    }
//                    else
//                    {
//                        module_1.state = "still"
//                    }
                }
            }
        }
    back:
        Image {width: 300;height: 200;  source: "image/Frontwindowsbg.png"; anchors.centerIn: parent }
    //
    transform:
        Rotation { id: rotation;  origin.x: module_1.width/2;  origin.y: module_1.height/2; axis.x: 0; axis.y: 1; axis.z: 0;  angle: 0; }
    //
    states:
    [
        State
        {
            name: "change"
            PropertyChanges { target: rotation; angle: 360 }
            PropertyChanges { target: lala; width:800; height:480;}
            PropertyChanges { target: lala; anchors.horizontalCenterOffset:0; anchors.verticalCenterOffset:0;}
            PropertyChanges { target: module_0; visible:false ; }
            PropertyChanges { target: module_2; visible:false}
            PropertyChanges { target: clock_text; visible:false}
            PropertyChanges { target: title; visible:false}
            PropertyChanges { target: pic; visible:false}
        },
        State
        {
            name:"still"
            PropertyChanges { target: module_0; visible:true}
            PropertyChanges { target: module_2; visible:true}
            PropertyChanges { target: clock_text; visible:true}
            PropertyChanges { target: title; visible:true}
            PropertyChanges { target: pic; visible:true}
        }
     ]
    //
    transitions:
    [
        Transition
        {
            from:"still"
            to:"change"
            NumberAnimation { target: rotation; property: "angle"; duration: 800 ;easing.type:Easing.InOutCubic}
            NumberAnimation { target: lala; property: "width"; duration: 800 ;easing.type:Easing.InOutCubic}
            NumberAnimation { target: lala; property: "height"; duration: 800 ;easing.type:Easing.InOutCubic }
            PropertyAnimation{ targets: [module_0,module_2,clock_text,title,pic]; property:"visible";  duration: 100;}
        },
        Transition
        {
            from:"change"
            to:"still"
            NumberAnimation { target: rotation; property: "angle"; duration: 800 ;easing.type:Easing.InOutCubic}
            NumberAnimation { target: lala; property: "width"; duration: 800 ;easing.type:Easing.InOutCubic}
            NumberAnimation { target: lala; property: "height"; duration: 800 ;easing.type:Easing.InOutCubic }
            PropertyAnimation{ targets: [module_0,module_2,clock_text,title,pic]; property:"visible";  duration: 600;}
        }
    ]
}

import QtQuick 1.0

Item {
    id: container
    state: "vanish"
    states: [
        State {
            name: "show"
            when:send_Message.x == 600
            PropertyChanges {target: container_text; x:30;opacity:1 }
            PropertyChanges {target: inputFeild; x:0; opacity:1 }
            PropertyChanges {target: confirm_button; x:0; opacity:1  }
            PropertyChanges {target: clear_button; x:0; opacity:1  }
            PropertyChanges {target: exit_button; x:0; opacity:1  }
        },
        State {
            name: "vanish"
            when:send_Message.x != 600
            PropertyChanges {target: container_text; x:200;opacity:0 }
            PropertyChanges {target: inputFeild; x:200; opacity:0 }
            PropertyChanges {target: confirm_button; x:200; opacity:0  }
            PropertyChanges {target: clear_button; x:200; opacity:0  }
            PropertyChanges {target: exit_button; x:200; opacity:0  }
        }
    ]
    transitions: Transition {
            NumberAnimation{ target: container_text;  properties: "x,opacity"; duration: 600; easing.type: Easing.OutQuint }
            NumberAnimation{ target: inputFeild;  properties: "x,opacity"; duration: 750; easing.type: Easing.OutQuint }
            NumberAnimation{ target: confirm_button;  properties: "x,opacity"; duration: 900; easing.type: Easing.OutQuint }
            NumberAnimation{ target: clear_button;  properties: "x,opacity"; duration: 1050; easing.type: Easing.OutQuint }
            NumberAnimation{ target: exit_button;  properties: "x,opacity"; duration: 1200; easing.type: Easing.OutQuint }

    }
    Image
    {
        id:container_title
        anchors.fill: parent
        source: "image/SendMessagebg.jpg"
        Text {
                id:container_text; y:30;font.family: "Courier"
                //anchors { top: parent.top; horizontalCenter: parent.horizontalCenter; topMargin: 30}
                color: "White"; font.pixelSize: 13; text: "Send Current Status"+"\n"+"To Phone"
            }
    }
    Rectangle
    {
        id:inputFeild; width: 200;height: 35
        y:90
        TextInput
        {
            id:text_Input;   objectName: "inputText"
            anchors.centerIn: parent ;   cursorVisible: true
            text:qsTr("PhoneNumber");font.family: "Courier"
            color: "grey"; font.pixelSize: 16
            maximumLength:11
        }
    }
    Image
    {
        id:confirm_button; anchors.top: inputFeild.bottom; anchors.topMargin: 10
        source: "image/smeb.jpg"
        Text {
                anchors {centerIn: parent}
                color: "White"; font.pixelSize: 16; text: "Comfirm & Send";font.family: "Courier"
            }
        MouseArea
        {
            anchors.fill: parent;hoverEnabled: true
            onEntered: confirm_button.source = "image/smebp.jpg"
            onExited: confirm_button.source = "image/smeb.jpg"
            onClicked:
            {
                gprs.gainMessage(text_Input.text);
                console.log("Send Message Successfully")
            }
        }
    }
    Image
    {
        id:clear_button; anchors.top: confirm_button.bottom; anchors.topMargin: 10
        source: "image/smeb.jpg"
        Text {
                anchors {centerIn: parent}
                color: "White"; font.pixelSize: 16; text: "Clear";font.family: "Courier"
            }
        MouseArea
        {
            anchors.fill: parent; hoverEnabled: true
            onEntered: clear_button.source = "image/smebp.jpg"
            onExited: clear_button.source = "image/smeb.jpg"
            onClicked:
            {
                console.log("Clear")
                //text_Input.remove(0,12)
                /*                     lack of functions here                               */
                text_Input.focus = true
            }
        }
    }
    Image
    {
        id:exit_button; anchors.bottom: parent.bottom; //anchors.topMargin: 10
        source: "image/smeb.jpg"
        Text {
                anchors {centerIn: parent}
                color: "White"; font.pixelSize: 16; text: "Exit";font.family: "Courier"
            }
        MouseArea
        {
            anchors.fill: parent;  hoverEnabled: true
            onEntered: exit_button.source = "image/smebp.jpg"
            onExited: exit_button.source = "image/smeb.jpg"
            onClicked:
            {
                messageShow = false
            }
        }
    }

}

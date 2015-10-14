import QtQuick 1.0
Flickable
{
        width: 230; height: 300; x:515;  y:28
        clip: true
             ListModel
                        {
                            id:lymol
                            ListElement {    icon: "image/Neusoft/东软1.jpg"  }
                            ListElement {    icon: "image/Neusoft/东软2.jpg"  }
                            ListElement {    icon: "image/Neusoft/东软3.jpg"  }
                            ListElement {    icon: "image/Neusoft/东软4.jpg"  }
                            ListElement {    icon: "image/Neusoft/东软5.jpg"  }
                            ListElement {    icon: "image/Neusoft/东软6.jpg"  }
                            ListElement {    icon: "image/Neusoft/东软7.jpg"  }
                            ListElement {    icon: "image/Neusoft/东软8.jpg"  }
                            ListElement {    icon: "image/Neusoft/东软9.jpg"  }
                            ListElement {    icon: "image/Neusoft/东软10.jpg"  }
                            ListElement {    icon: "image/Neusoft/东软11.jpg"  }
                            ListElement {    icon: "image/Neusoft/东软12.jpg"  }
                            ListElement {    icon: "image/Neusoft/东软13.jpg"  }
                            ListElement {    icon: "image/Neusoft/东软14.jpg"  }
                            ListElement {    icon: "image/Neusoft/东软15.jpg"  }
                            ListElement {    icon: "image/Neusoft/东软16.jpg"  }
                            ListElement {    icon: "image/Neusoft/东软17.jpg"  }
                            ListElement {    icon: "image/Neusoft/东软18.jpg"  }
                            ListElement {    icon: "image/Neusoft/东软19.jpg"  }
                            ListElement {    icon: "image/Neusoft/东软20.jpg"  }
                            ListElement {    icon: "image/Neusoft/东软21.jpg"  }
                            ListElement {    icon: "image/Neusoft/东软22.jpg"  }
                        }
             Component
             {
                  id: delegate
                   Column
                   {
                     id: wrapper
                      Image  {  width: 220; height: 300; source: icon }
                    }
              }
              PathView
              {
                    anchors.fill: parent
                    model: lymol
                    delegate: delegate
                    path:  Path
                    {
                          startX: -4000; startY: 90
                        PathQuad { x: 4000; y: 90; controlX: 260; controlY: 90 }
                     }
                }
    }



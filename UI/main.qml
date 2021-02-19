import QtQuick 2.9
import QtQuick.Controls 2.9

ApplicationWindow {
    visible: true
    width: 360
    height: 600
    x: screen.desktopAvailableWidth - width - 12
    y: screen.desktopAvailableHeight - height - 48
    title: "HelloApp"
    flags: Qt.FramelessWindowHint | Qt.Window
    property string currTime: "00:00:00"
    property QtObject backend
    Rectangle {
        anchors.fill: parent
        Image {
            sourceSize.width: parent.width
            sourceSize.height: parent.height
            source: "./images/hai.jpg"
            fillMode: Image.PreserveAspectFit
        }
        Text {
            anchors {
                bottom: parent.bottom
                bottomMargin: 12
                left: parent.left
                leftMargin: 12
            }
            text: currTime
            font.pixelSize: 48
            color: "white"
        }
    }

    Connections {
        target: backend
        function onUpdated(msg) {
            currTime = msg;
        }
    }
}



// ApplicationWindow {
//     visible: true
//     width: 360
//     height: 600
//     x: screen.desktopAvailableWidth - width - 12
//     y: screen.desktopAvailableHeight - height - 48
//     title: 'HelloApp'

//     flags: Qt.FramelessWindowHint | Qt.Window

//     property string currTime: "00:00:00"
//     property QtObject backend //erstellt ein QtObject-Backend für unser Python-Objekt back_end.

//     Rectangle {
//         anchors.fill: parent
        
//         Image {
//              sourceSize.width: parent.width
//              sourceSize.height: parent.height
//              source: "./images/hai.jpg"
//              fillMode: Image.PreserveAspectCrop
//              }
        
//         Text {
//             anchors {
//                 bottom: parent.bottom
//                 bottomMargin: 12 // einrücken pixel nach oben
//                 left: parent.left
//                 leftMargin: 12 // einrücken pixel nach rechts
//             }
//                 // text: "16:38:33"
//             text: currTime
//             font.pixelSize: 24
//             color: "white"
//             }
//         }
        
//     }

//     Connections {
//         target: backend
//         function onUpdated(msg) {
//             currTime = msg;
//         }
//     }
//     // Das Obige enthält einen ApplicationWindow-Typ, einen Rechteck-Typ, der tatsächlich den gesamten Bereich des Fensters ausfüllt.
//     // Darin befindet sich ein Bild und ein weiteres Rechteck, das wie daneben aussieht. Da jedoch kein Layout-Typ vorhanden ist, 
//     // befindet es sich tatsächlich über dem Bildtyp. Das Rechteck hat eine transparente Farbe, da Rechtecke standardmäßig weiß sind. 
//     // Darin befindet sich ein Text mit der Aufschrift 16:38:33

//     // Wenn Sie die App ausführen, wird der Text in der oberen linken Ecke des Fensters angezeigt. Das gefällt uns nicht und wir werden 
//     // es stattdessen in der unteren linken Ecke mit einigen Rändern erscheinen lassen.
//     // Aktualisieren Sie in Ihrem qml-Code den Texttyp so, dass er Anker enthält, wie unten gezeigt:

//             // Text {
//             //     anchors {
//             //         bottom: parent.bottom
//             //         bottomMargin: 12
//             //         left: parent.left
//             //         leftMargin: 12
//             //     }
//             //     text: "16:38:33"
//             //     font.pixelSize: 24
//             //     ...
//             // }


// }
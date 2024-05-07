import QtQuick

Window {
    id: root
    width: 400; height: 800
    visible: true
    title: qsTr("IOT")

    Rectangle{
        anchors.fill: parent

        // 背景色
        Rectangle{
            anchors.fill: parent
            color: "lightgray"
        }

        Grid{
            id: btns
            anchors.fill: parent
            columns: 2
            padding: parent.width / 9
            spacing: parent.width / 9

            SwitchButton{
                // x: 0; y: 0
                width: parent.width / 3
                height: width / 3
                btnType: "Wifi"

                onCheckedChanged: console.log(checked)
            }
            SwitchButton{
                // x: 0; y: parent.width / 3
                width: parent.width / 3
                height: width / 3
                btnType: "Bluetooth"

                onCheckedChanged: console.log(checked)
            }
            SwitchButton{
                // x: 0; y: parent.width / 3 * 2
                width: parent.width / 3
                height: width / 3
                btnType: "Light"

                onCheckedChanged: console.log(checked)
            }
            SwitchButton{
                // x: parent.width / 2; y: parent.width / 3 * 2
                width: parent.width / 3
                height: width / 3
                btnType: "Null"

                onCheckedChanged: console.log(checked)
            }
        }

        CircleProgress{
            anchors.top: btns.bottom

            width: parent.width
            height: 100
        }

        Text {
            id: name
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottomMargin: 20
            text: qsTr("哔哩哔哩up主：十_OvO自制")
        }
    }
}

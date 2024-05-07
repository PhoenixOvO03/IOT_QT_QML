import QtQuick
import QtQuick.Shapes
import QtQuick.Particles

Item {
    id: root
    property bool checked: false
    property string btnType: "null"
    property double r: height / 2

    // 底层灰色
    Rectangle{
        anchors.fill: parent
        radius: root.r
        color: "gray"

        // 渐变
        Shape
        {
            anchors.fill: parent
            ShapePath
            {
                strokeColor: "transparent"
                startX: root.r; startY: 0
                PathLine{x: btn.x + root.r; y: 0}
                PathLine{x: btn.x + root.r; y: root.height}
                PathLine{x: root.r; y: root.height}
                PathArc{x: root.r; y: 0; radiusX: root.r; radiusY: root.r; useLargeArc: true}

                fillGradient: LinearGradient
                {
                    x1: 0; y1: 0
                    x2: root.width; y2: 0
                    GradientStop{position: 0.2; color: "#FF35B3FB"}
                    GradientStop{position: 0.8; color: "#C8FF587F"}
                }
            }
        }

        // 滑动按钮
        Rectangle{
            id: btn
            x: root.checked ? root.width - root.height : 0; y: 0
            width: parent.height; height: width
            radius: root.r
            color: "white"

            Behavior on x{
                NumberAnimation{
                    duration: 300
                }
            }

            Image {
                id: buttonImage
                anchors.fill: parent
                source: {
                    switch (root.btnType)
                    {
                    case "Bluetooth": return "./assets/Bluetooth.png"
                    case "Light": return "./assets/light.png"
                    case "Wifi": return "./assets/wifi.png"
                    default: return "./assets/null.png"
                    }
                }
            }

            // 粒子系统
            ParticleSystem{
                id: particleSystem
            }

            Emitter{
                system: particleSystem
                width: 1; height: root.height / 2
                // anchors.centerIn: parent
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                emitRate: root.checked ? 10 : 0
                lifeSpan: 1000
                size: root.height / 10
                endSize: root.height / 3

                velocity: AngleDirection{
                    angle: 180
                    angleVariation: 15
                    magnitude: root.width / 2
                    magnitudeVariation: root.width / 4
                }
            }

            ImageParticle{
                system: particleSystem
                source: buttonImage.source
            }
        }

        // 点击事件
        MouseArea{
            anchors.fill: parent
            onClicked: {
                root.checked = !root.checked
            }
        }
    }
}

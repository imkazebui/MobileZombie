import QtQuick 2.0
import VPlay 2.0
Item {
    property bool isLock: false
    property int level: 0
    width: parent.width
    height: parent.height
    Text{
        font.family: gameFont.name
        font.pixelSize: 18
        color: "white"
        text: level
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        visible: level<=gameScene.reach
    }
    Image{
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        source: "../../assets/img/locker.png"
        visible: !(level<=gameScene.reach)

    }
    StarSmall{
        id:sm
        starsmall:(storage.getValue("level"+(level)))?(storage.getValue("level"+(level))):0

        anchors.bottom: parent.bottom
        visible: (level<gameScene.reach)
    }
}


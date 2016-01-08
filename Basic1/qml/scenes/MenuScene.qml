import QtQuick 2.0
import VPlay 2.0
import "../common"

SceneBase{
    id: scene
    signal gamePressed(int type)

    Image {
        anchors.fill: parent.gameWindowAnchorItem
        source: "../../assets/img/menu.png"
    }
    Menu{
        anchors.horizontalCenter: scene.gameWindowAnchorItem.horizontalCenter
        y: scene.height/2 + 50
        onStartPressed: {
            gamePressed(1)
        }
        onHighscorePressed: {
            gamePressed(2)
        }
    }

}


import QtQuick 2.0
import VPlay 2.0
import "../common"

SceneBase {
    id: scene
    signal startLevel(int level)
    property int spaceVertical: 80
    Image {
        anchors.fill: parent.gameWindowAnchorItem
        source: "../../assets/img/bg.png"
    }
    LevelButtonRow{
        id: row0
        anchors.horizontalCenter: scene.gameWindowAnchorItem.horizontalCenter
        row: 0
        y: 10+spaceVertical*row
        onLevelPressed: {
            startLevel(row*4+index)
        }
    }
    LevelButtonRow{
        id: row1
        anchors.horizontalCenter: scene.gameWindowAnchorItem.horizontalCenter
        row: 1
        y: 10+spaceVertical*row
        onLevelPressed: {
            startLevel(row*4+index)
        }
    }
    LevelButtonRow{
        id: row2
        anchors.horizontalCenter: scene.gameWindowAnchorItem.horizontalCenter
        row: 2
        y: 10+spaceVertical*row
        onLevelPressed: {
            startLevel(row*4+index)
        }
    }
    LevelButtonRow{
        id: row3
        anchors.horizontalCenter: scene.gameWindowAnchorItem.horizontalCenter
        row: 3
        y: 10+spaceVertical*row
        onLevelPressed: {
            startLevel(row*4+index)
        }
    }
}


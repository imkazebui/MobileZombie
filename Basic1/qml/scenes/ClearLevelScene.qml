import QtQuick 2.0
import VPlay 2.0
import "../common"
import "../entities"
SceneBase {
    id:scene
    property int scoreWin: 0
    Image {
        anchors.fill: parent.gameWindowAnchorItem
        source: "../../assets/img/leverclear.png"
    }
    Text{
        id:textScore
        font.family: gameFont.name
        font.pixelSize: 18
        color: "white"
        text: scoreWin
        x: 165
        y: 250
    }
    Star{
        id: star
        x: 100
        y: 160
        anchors.horizontalCenter: parent.horizontalCenter
    }
    ClearLevelButtonRow{
        id:leverClearBtn
        anchors.horizontalCenter: parent.horizontalCenter
        y:350
        onMenuPressed: {
            gameScene.resetGame()
            gameWindow.state = "state"
        }
        onResetPressed:{
            gameScene.resetGame()
            gameWindow.state = "game"
        }
        onNextPressed: {

        }
    }
    onScoreWinChanged: {
        star.calcStar()
        star.displayStar()
    }

}


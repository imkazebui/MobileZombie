import QtQuick 2.0
import VPlay 2.0
import "../entities"
import "../common"
import "../level"

SceneBase{
    id: scene
    property bool gameIsRunning: false
    property alias live:live
    property alias textCombo:textCombo
    property alias processBar: processBar
    property int max_level: 16
    property int reach: 0
    property int level: 0
    property int score: 0
    property int combo: 0

    Image{
        anchors.fill: parent.gameWindowAnchorItem
        source: "../../assets/img/bg.png"
    }
    PhysicsWorld
    {
        debugDrawVisible: false
        gravity.y: 0
    }
    BackgroundMusic {
      id: sound_background
      source: "../../assets/sound/sound-background.mp3"
    }

    BackgroundMusic {
      id: sound_lv1
      source: "../../assets/sound/sound-background.mp3"
      autoPlay: false
    }
    Text {
      // set font
      font.family: gameFont.name
      font.pixelSize: 18
      color: "white"
      text: score

      // set position
      anchors.horizontalCenter: parent.horizontalCenter
      y: 10
    }
    Live{
        id:live
        y:5
        anchors.right: parent.right
        anchors.rightMargin: 10
        number: 3
    }
    MouseArea{
        anchors.fill:scene
        onClicked:{
            combo=0
        }
    }
    Text {
      // set font
      id:textCombo
      font.family: gameFont.name
      font.pixelSize: 18
      color: "white"
      text: "Combo:"+combo
      x: 10
      y: 10
    }
    ProcessBar{
        id:processBar
        x:10
        y:60
    }
    onGameIsRunningChanged: {
        if(scene.gameIsRunning)
        {
            itemLoader.active = true
        }else{
            entityManager.removeAllEntities()
            itemLoader.active = false
        }
    }
    Loader{
        id: itemLoader
        active: false
        source: "../level/Level3.qml"
        onLoaded: {
            sound_background.stop()
            sound_lv1.play()
        }
    }
    function resetGame(){
        score = 0
        combo = 0

    }
}


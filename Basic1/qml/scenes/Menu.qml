import QtQuick 2.0
import VPlay 2.0

Column {
    signal startPressed()
    signal highscorePressed()
    anchors.horizontalCenter: parent.horizontalCenter
    height: menuItem.height
    spacing:30
    property int type:1
    ImageButton {
      id: menuItem
      onClicked: {
        startPressed()
      }
      source:{
          switch(type)
          {
          case 1:
              return "../../assets/img/start.png"
          case 2:
              return "../../assets/img/playagain.png"
          }


      }
    }
    ImageButton {
      id: menuItem1
      onClicked: {
        highscorePressed()
      }
      source: "../../assets/img/highscore.png"
    }
}


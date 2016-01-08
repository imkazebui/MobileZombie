import VPlay 2.0
import QtQuick 2.0
import "scenes"

GameWindow {
    id: gameWindow
    width: 320
    height: 480
    property int highscore: 0
    property variant levels: []
    property alias storage: storage
    property alias gameWindow: gameWindow
    property alias entityManager: entityManager
    property alias live_max: gameScene.live
    property alias textCombo: gameScene.textCombo
    property alias gameScene: gameScene
    property alias processBar: gameScene.processBar

    Storage {
        id: storage
        Component.onCompleted: {

            //level
            clearAllAtStartup: true
            var level = 1
            for(var i = 1; i < gameScene.max_level; i++)
            {
                if(!getValue("level"+i))
                {
                    levels.push(i)
                    gameScene.reach = i
                    //console.log("reach:"+gameScene.reach)
                    console.log("levels:"+levels)
                    break
                }

            }

            if(getValue("highscore"))
            {
                gameWindow.highscore = getValue("highscore")
                console.log("highscore:"+gameWindow.highscore)
            }
        }
      }
    state: "menu"

    MenuScene {
      id: menuScene
      onGamePressed: {
        if(type==1)
            gameWindow.state = "state"
        else if(type==2)
            gameWindow.state = "highscore"
      }
    }
    GameScene{
        id: gameScene
    }
    StateScene{
        id: stateScene
        onStartLevel: {
            console.log("start level "+level)
            gameScene.level = level
            gameWindow.state = "game"
        }
    }
    GameOver{
        id:gameOver

    }
    ClearLevelScene{
        id:clearLevelScene
    }
    HighscoreScene{
        id:highscoreScene
    }
    EntityManager {
      id: entityManager
      // entities shall only be created in the gameScene
      entityContainer: gameScene
      onEntityContainerChanged: {
        console.log(entityContainer)
      }
    }
    FontLoader {
      id: gameFont
      source: "../assets/fonts/akaDylan Plain.ttf"
    }

    states: [
        State {
          name: "menu"
          PropertyChanges {target: menuScene; opacity: 1}
          PropertyChanges {target: gameWindow; activeScene: menuScene}
          //StateChangeScript {
          //  script: {
          //    audioManager.play(audioManager.idSWOOSHING)
          //  }
          //}
        },
        State{
            name:"state"
            PropertyChanges {target: stateScene; opacity: 1}
            PropertyChanges {target: gameWindow; activeScene: stateScene}
        },
        State {
          name: "game"
          PropertyChanges {target: gameScene; opacity: 1}
          PropertyChanges {target: gameWindow; activeScene: gameScene}
          PropertyChanges {target: gameScene; gameIsRunning:true}
          //StateChangeScript {
           // script: {
            //  gameScene.enterScene()
            //  audioManager.play(audioManager.idSWOOSHING)
           // }
         // }
        },
        State{
            name: "gameover"
            PropertyChanges {target: gameOver; opacity: 1}
            PropertyChanges {target: gameWindow; activeScene: gameOver}
            PropertyChanges {target: gameOver; scoreWin: gameScene.score}
            PropertyChanges {target: gameScene; gameIsRunning:false}
        },
        State{
            name: "levelclear"
            PropertyChanges {target: clearLevelScene; opacity: 1}
            PropertyChanges {target: clearLevelScene; scoreWin: gameScene.score}
            PropertyChanges {target: gameWindow; activeScene: clearLevelScene}
            PropertyChanges {target: gameScene; gameIsRunning:false}
        },
        State{
            name: "highscore"
            PropertyChanges {target: highscoreScene; opacity: 1}
            PropertyChanges {target: gameWindow; activeScene: highscoreScene}
        }
    ]
}


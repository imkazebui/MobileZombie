import QtQuick 2.0
import VPlay 2.0

EntityBase {

    property int type: 1
    property bool died: false
    property string p: "none"
    property variant paths: ["none", "straight_turnleft", "straight_turnright"]

    property int startPoint //x start
    property int endPoint: gameScene.height //reach bottom

    entityType: "zombie"
    height: spriteSequence.height
    width: spriteSequence.width
    SpriteSequenceVPlay {
        id: spriteSequence
        z:2
        scale: 1
        SpriteVPlay {
          name: "run"
          frameCount: {
            if(type==1)
                return 8
            else if(type==2)
                return 7
            else if(type==3)
                return 8
            else if(type==4)
                return 8
            else if(type==5)
                return 4
            else if(type==6)
                return 8
            else if(type==7)
                return 8
            else if(type==8)
                return 7
          }
          frameRate: {
            switch(type)
            {
            case 1:
            case 2:
            case 3:
            case 4:
            case 6:
            case 7:
            case 8:
                return 10
            case 5:
                return 5
            }
          }
          frameWidth: {
            if(type==1)
                return 57
            else if(type==2)
                return 54
            else if(type==3)
                return 59
            else if(type==4)
                return 61
            else if(type==5)
                return 41
            else if(type==6)
                return 62
            else if(type==7)
                return 55
            else if(type==8)
                return 62
          }
          frameHeight: {
            if(type==1||type==2||type==3||type==4||type==8)
                return 63
            else if(type==5)
                return 55
            else if(type==6)
                return 58
            else if(type==7)
                return 54
          }
          frameX: 0
          frameY:{
            if(type==1)
                return 0
            else if(type==2)
                return 63
            else if(type==3)
                return 126
            else if(type==4)
                return 189
            else if(type==5)
                return 252
            else if(type==6)
                return 377
            else if(type==7)
                return 435
            else if(type==8)
                return 312 //do them sau cung
          }
          source: "../../assets/img/my-game.png"
        }
        SpriteVPlay {
          name: "die"
          frameCount: 1
          frameWidth: {
              switch(type)
              {
              case 1:
                  return 60
              case 2:
                  return 63
              case 3:
                  return 63
              case 4:
                  return 62
              case 5:
                  return 41
              case 6:
                  return 64
              case 7:
                  return 62
              case 8:
                  return 59
              }
          }
          frameHeight: {
              switch(type)
              {
              case 1:
              case 2:
                  return 64
              case 3:
                  return 63
              case 4:
                  return 62
              case 5:
                  return 59
              case 6:
                  return 64
              case 7:
                  return 57
              case 8:
                  return 63
              }
          }
          frameX: 0
          frameY:{
              switch(type)
              {
              case 1:
                  return 0
              case 2:
                  return 64
              case 3:
                  return 64+64
              case 4:
                  return 64+64+63
              case 5:
                  return 64+64+63+62
              case 6:
                  return 375
              case 7:
                  return 443
              case 8:
                  return 312
              }
          }
          source: "../../assets/img/die.png"
        }
        NumberAnimation on opacity {
            id: hideAnimation
            to: 0
            duration: 600
            running: false
            easing.type: Easing.InQuart
            onStopped: {
            }
        }
    }

    Component.onCompleted: {
        //console.log("height:" + height)
    }
    onYChanged: {
        if(y>=gameScene.height)
        {
            //tru diem

            if(live_max.number > 0)
            {
                live_max.number--
            }else{
                gameWindow.state = "gameover"
            }
            removeEntity()
        }
    }
    onXChanged:{
        if(x>=gameScene.width)
            x=1
    }


    ParticleVPlay{
        id:deathParticle
        fileName: "DeathParticle.json"
        anchors.horizontalCenter: spriteSequence.horizontalCenter
        anchors.verticalCenter: spriteSequence.verticalCenter
        //rotation:Math.random()*360
        rotation: 90
        angle: 0
        angleVariance: 360
        z:1
        onRunningChanged:{
            if(!running)
                removeEntity()
        }
    }
    PathMovement {
        id: path
        velocity: 100
        rotationAnimationEnabled:false
        waypoints:
        {
            switch(p)
            {
            case "none":
                return [{x:startPoint, y:0 },{x:startPoint, y:endPoint } ]
            case "straight_turnleft":
                return [{x:startPoint, y:0 },{x:startPoint, y:(endPoint/2)},{x:(startPoint-gameScene.width/2), y:endPoint} ]
            case "straight_turnright":
                return [{x:startPoint, y:0 },{x:startPoint, y:(endPoint/2)},{x:(startPoint+gameScene.width/2), y:endPoint} ]
            }
        }
        onPathCompleted: {
            //console.debug("last waypoint reached, destroy the entity");
            removeEntity();
        }
    }

    MouseArea{
        anchors.fill:spriteSequence
        onClicked:{
            if(!died){
                died=true
                gameScene.score++
                gameScene.combo++
                zb_Die.play()
            }
            path.running = false
            console.log((mouseX+this.x)+","+(this.y+mouseY))
            deathParticle.start()
            spriteSequence.jumpTo("die")
            hideAnimation.start()

        }
    }
    SoundEffectVPlay {
      id: zb_Die
      source: "../../assets/sound/zb-die.wav"
    }

}


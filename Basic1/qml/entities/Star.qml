import QtQuick 2.0
import VPlay 2.0
Row {
    id: starRow
    property int numberStar: 0
    property int i: 0
    spacing: 15
    Image{
        id:s1
        source:"../../assets/img/star-off.png"
        visible:true
        NumberAnimation on scale{
            id: star1
            from:6
            to:1
            duration: 500
            running: false
            onStarted: {
               s1.source = "../../assets/img/star-on.png"
            }
        }
    }
    Image{
        id:s2
        source:"../../assets/img/star-off.png"
        visible:true
        NumberAnimation on scale{
            id: star2
            from:6
            to:1
            duration: 500
            running: false
            onStarted: {
               s2.source = "../../assets/img/star-on.png"
            }
        }
    }
    Image{
        id:s3
        source:"../../assets/img/star-off.png"
         visible:true
         NumberAnimation on scale{
             id: star3
             from:6
             to:1
             duration: 500
             running: false
             onStarted: {
                s3.source = "../../assets/img/star-on.png"
             }
         }
    }
    function calcStar(){
        //console.log("combo:"+gameScene.combo+",score:"+gameScene.score+",live:"+live_max.number)
        if(gameScene.combo === gameScene.score)
            numberStar=3
        else if(live_max.number>=3&&gameScene.combo !== gameScene.score)
            numberStar=2
        else
            numberStar=1
        console.log("level:"+gameScene.level)
        if(gameScene.level === gameScene.reach)
            gameScene.reach++
        storage.setValue("level"+gameScene.level, numberStar)
    }
    function displayStar(){
        timerStar1.start()
    }
    Timer{
        id:timerStar1
        interval: 600
        repeat: true
        running: false
        onTriggered: {
            if(i===0){
                star1.start()
                i++
            }else if(i===1)
            {
                star2.start()
                i++
            }else if(i===2)
            {
                star3.start()
                i++
            }
            if(i===numberStar)
                running = false
        }
    }


}


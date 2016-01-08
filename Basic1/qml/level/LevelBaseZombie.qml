import QtQuick 2.0
import VPlay 2.0
Item {
    id: main
    property int totalInteval: 0
    property int  i: 0
    property int soCon: 0
    property int soConDaTha: 0
    property int interval: 700

    function changeInterval(intv){
        interval = intv
    }
    function taoZombie(startPoint, typeZombie){

        if(soConDaTha === 1)
        {
            entityManager.removeLastAddedEntity()
        }
        if(typeZombie!==0){
            entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("../entities/Zombie.qml"),
                                                                {"startPoint": startPoint,
                                                                 "type": typeZombie,
                                                                 "p": "none",})
        }else{
            entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("../entities/Zombie.qml"),
                                                                    {"startPoint": 0,
                                                                     "type": 1,
                                                                     "p": "none",
                                                                     "visible": false})
        }
        soConDaTha++
    }
    function sleep(time){
        totalInteval+=time
    }
    function delay(delayTime, cb) {
        //console.log(delayTime)
        var timer = Qt.createQmlObject("import QtQuick 2.0; Timer {}", parent);
        timer.interval = delayTime;
        timer.repeat = false;
        timer.triggered.connect(cb);
        timer.start();
    }

    function thaZombie(startPoint, type)
    {
        soCon++
        totalInteval+=interval
        //console.log(numberDelay)
        delay(totalInteval, function(){
            taoZombie(startPoint, type)
        })
        zb_ef_1.play();
    }
    function tha6Zombie(type){
        thaZombie(randomX(), type)
        thaZombie(randomX(), type)
        thaZombie(randomX(), type)
        thaZombie(randomX(), type)
        thaZombie(randomX(), type)
        thaZombie(randomX(), type)
    }
    function thaXZombie(n, type){
        for (i; i < n; i++){
            thaZombie(randomX(), type)
        }
        zb_ef_1.play();
        i = 0
    }
    function thaZigZag(type){
        thaZombie(30, type)
        thaZombie(70, type)
        thaZombie(110, type)
        thaZombie(150, type)
        thaZombie(190, type)

        thaZombie(190, type)
        thaZombie(150, type)
        thaZombie(110, type)
        thaZombie(70, type)
        thaZombie(30, type)
    }
    function randomX(){
        return utils.generateRandomValueBetween(15,230);
    }

    SoundEffectVPlay {
      id: zb_ef_1
      source: "../../assets/sound/zb-eff-1.wav"
    }

    Timer{
        id: win
        interval: 300
        repeat: true
        running: false
        onTriggered: {
            var entities = entityManager.getEntityArrayByType("zombie")
            if(entities.length === 0)
            {
                console.log("you win")
                running = false
                if(gameScene.score>gameWindow.highscore){
                    storage.setValue("highscore", gameScene.score)
                }
                gameWindow.state = "levelclear"
            }
        }
    }
    Timer{
        property int total: 0
        //15000ms, chay tu tu
        id:changeProcess
        interval: 500
        repeat:true
        running: true
        onTriggered: {
            total+=500
            if(total>=15000)
                running = false
            processBar.process+=(100/30)
        }
    }
    onTotalIntevalChanged: {
        console.log("total:"+totalInteval)
    }
}


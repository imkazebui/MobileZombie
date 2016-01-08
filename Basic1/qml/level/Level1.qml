import QtQuick 2.0
import VPlay 2.0
import "../common"
import "../entities"
import ".."
LevelBaseZombie {
    id:level1

    Component.onCompleted:{
        thaZombie(0, 0) //INIT
        thaZombie(30, 1)
        sleep(2000)
        thaZombie(130, 1)
        sleep(2000)
        thaZombie(50, 1)
        sleep(2000)
        thaZombie(230, 1)
        sleep(2000)
        changeInterval(500)
        thaZombie(30, 2)
        thaZombie(130, 2)
        thaZombie(50, 2)
        thaZombie(230, 2)
        thaZombie(30, 2)
        thaZombie(130, 2)
        thaZombie(50, 2)


    }

}


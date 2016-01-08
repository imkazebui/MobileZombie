import QtQuick 2.0
import VPlay 2.0
import "../common"
import "../entities"
import ".."
LevelBaseZombie {
    id:level1

    Component.onCompleted:{
        thaZombie(0, 0) //INIT

        thaZombie(30,1)
        thaZombie(60,1)
        thaZombie(30,1)
        thaZombie(60,1)
        thaZombie(30,1)
        thaZombie(60,1)
        win()
    }

}


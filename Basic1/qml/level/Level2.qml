import QtQuick 2.0
import VPlay 2.0
import "../common"
import "../entities"
import ".."
LevelBaseZombie {
    id:level2

    Component.onCompleted:{
        thaZombie(0, 0) //INIT
        thaZombie(30, 1)
        thaZombie(randomX(), 1)
        thaZombie(randomX(), 1)
        sleep(2000)
        thaZombie(130, 1)
        thaZombie(randomX(), 1)
        thaZombie(randomX(), 1)
        sleep(2000)
        thaZombie(50, 2)
        thaZombie(randomX(), 2)
        thaZombie(randomX(), 2)
        sleep(2000)
        thaZombie(230, 2)
        thaZombie(randomX(), 2)
        thaZombie(randomX(), 2)
        sleep(2000)
        changeInterval(200)
        thaZombie(30, 3)
        thaZombie(130, 3)
        thaZombie(50, 3)
        thaZombie(230, 3)
        thaZombie(30, 3)
        thaZombie(130, 3)
        thaZombie(50, 3)
    }

}


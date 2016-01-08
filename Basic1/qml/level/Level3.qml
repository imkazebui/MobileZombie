import QtQuick 2.0
import VPlay 2.0
import "../common"
import "../entities"
import ".."
LevelBaseZombie {
    id:level3

    Component.onCompleted:{
        thaZombie(0, 0) //INIT
        thaZombie(30, 1)
        thaZombie(randomX(), 1)
        thaZombie(randomX(), 1)
        thaZombie(randomX(), 1)
        thaZombie(randomX(), 1)
        sleep(1500)
        thaZombie(randomX(), 1)
        thaZombie(randomX(), 1)
        thaZombie(randomX(), 1)
        thaZombie(randomX(), 1)
        sleep(1000)
        thaZombie(randomX(), 2)
        thaZombie(randomX(), 2)
        thaZombie(randomX(), 2)
        thaZombie(randomX(), 2)
        sleep(900)
        thaZombie(randomX(), 3)
        thaZombie(randomX(), 3)
        thaZombie(randomX(), 3)
        thaZombie(randomX(), 3)
        sleep(900)
        changeInterval(200)
        thaZombie(randomX(), 4)
        thaZombie(randomX(), 4)
        thaZombie(randomX(), 4)
        thaZombie(randomX(), 4)
        thaZombie(randomX(), 4)
        thaZombie(randomX(), 4)
    }

}


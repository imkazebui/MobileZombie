import QtQuick 2.0
import VPlay 2.0
import "../common"
import "../entities"
import ".."
LevelBaseZombie {
    id:level4

    Component.onCompleted:{
        thaZombie(0, 0) //INIT
        thaZombie(30, 1)
        thaXZombie(3,1)
        sleep(1500)
        thaXZombie(6,2)
        sleep(1000)
        thaXZombie(9,3)
        sleep(900)

        thaXZombie(12,4)
        sleep(800)
        thaXZombie(15,5)
        sleep(700)
        changeInterval(200)
        thaZombie(randomX(), 1)
        thaZombie(randomX(), 2)
        thaZombie(randomX(), 3)
        thaZombie(randomX(), 4)
        thaZombie(randomX(), 5)
        thaZombie(randomX(), 5)
        thaXZombie(3,1)
    }

}


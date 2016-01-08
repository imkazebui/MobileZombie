import QtQuick 2.0
import VPlay 2.0
Row {
    signal menuPressed()
    signal resetPressed()
    signal nextPressed()
    property bool isNextAvailable:true
    id: levelClearBtn
    spacing: 20

    ImageButton{
        id: menuItem
        source: "../../assets/img/menubtn.png"
        onClicked:menuPressed()
    }
    ImageButton{
        id: menuItem1
        source: "../../assets/img/resetbtn.png"
        onClicked:resetPressed()
    }
    ImageButton{
        id: menuItem2
        source: "../../assets/img/nextbtn.png"
        onClicked:nextPressed()
        visible: isNextAvailable
    }
}


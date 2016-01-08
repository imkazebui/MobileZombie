import QtQuick 2.0
import VPlay 2.0

Item {
    id: prcBar
    width: img.width
    height: img.height
    property int process: 0
    Image{
        id: img
        source: "../../assets/img/process.png"
    }
    Image{
        id:head
        source: "../../assets/img/head_zombie.png"
        x:0
        y:(process>85)?(img.height-head.height):(process/100*prcBar.height)
        anchors.horizontalCenter: parent.horizontalCenter
    }
}


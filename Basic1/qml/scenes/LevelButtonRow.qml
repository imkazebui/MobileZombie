import QtQuick 2.0
import VPlay 2.0
import "../entities"
Row {
    signal levelPressed(int index, int row)
    spacing: 20
    property int row: 0
    ImageButton{
        id: menuItem
        onClicked: {
          levelPressed(1, row)

        }
        source: "../../assets/img/levelbutton.png"
        LockOrText{
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            level:row*4+1
        }

    }
    ImageButton{
        id: menuItem1
        onClicked: {
          levelPressed(2, row)
        }
        source: "../../assets/img/levelbutton.png"
        LockOrText{
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            level:row*4+2
        }

    }
    ImageButton{
        id: menuItem2
        onClicked: {
          levelPressed(3, row)
        }
        source: "../../assets/img/levelbutton.png"
        LockOrText{
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            level:row*4+3
        }

    }
    ImageButton{
        id: menuItem3
        onClicked: {
          levelPressed(4, row)
        }
        source: "../../assets/img/levelbutton.png"
        LockOrText{
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            level:row*4+4
        }

    }
}


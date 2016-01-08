import QtQuick 2.0

Row {
    id: live
    property int number: 3

    Image{
        source: "../../assets/img/live.png"
        visible: live.number>=1?true:false
    }
    Image{
        source: "../../assets/img/live.png"
        visible: live.number>=2?true:false
    }
    Image{
        source: "../../assets/img/live.png"
        visible: live.number>=3?true:false
    }
}


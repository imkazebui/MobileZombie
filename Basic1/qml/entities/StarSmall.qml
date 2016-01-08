import QtQuick 2.0
import VPlay 2.0
Row{
    visible: true
    property int starsmall: 0
    anchors.horizontalCenter: parent.horizontalCenter
    Image{
        source: (starsmall>=1)?"../../assets/img/star-small-on.png":"../../assets/img/star-small-off.png"
    }
    Image{
        source: (starsmall>=2)?"../../assets/img/star-small-on.png":"../../assets/img/star-small-off.png"
    }
    Image{
        source: (starsmall>=3)?"../../assets/img/star-small-on.png":"../../assets/img/star-small-off.png"
    }
}


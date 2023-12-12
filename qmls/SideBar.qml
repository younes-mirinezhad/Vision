import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    property var _model: []
    property string _selectedURL: ""

    ListView{
        anchors.fill: parent
        model: _model

        delegate: MouseArea {
            width: parent.width
            height: width + 15

            ColumnLayout {
                id: btn
                anchors.fill: parent
                spacing: 0

                Image {
                    id: btnIcon
                    Layout.fillWidth: true
                    Layout.preferredHeight: width - 15
                    source: '../' + _icon
                    fillMode: Image.PreserveAspectFit
                }
                Text {
                    Layout.fillWidth: true
                    horizontalAlignment: Qt.AlignHCenter
                    text: _name
                    font.pointSize: 10
                }
                ToolSeparator {
                    orientation: Qt.Horizontal
                    Layout.fillWidth: true
                }
            }
            onClicked: _selectedURL = _url
            Component.onCompleted:
                if(_selectedURL.length < 1) _selectedURL = _url
        }

    }
}

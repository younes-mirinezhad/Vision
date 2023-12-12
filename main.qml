import QtQuick
import QtQuick.Window
import QtQuick.Controls.Material
import QtQuick.Controls
import QtQuick.Layouts
import './qmls'

Window {
    Material.theme: Material.Dark
    Material.accent: Material.Red
    width: 1280
    height: 720
    visible: true
    title: qsTr("Vision")

    ListModel {
        id: sidebarModel
        ListElement { _name: "Home"; _icon: "Icons/home.png"; _url: "qmls/HomePage.qml"}
        ListElement { _name: "Image"; _icon: "Icons/image.png"; _url: "qmls/ImagePage.qml"}
        ListElement { _name: "Video"; _icon: "Icons/video.png"; _url: "qmls/VideoPage.qml"}
    }

    Pane{
        anchors.fill: parent
        padding: 0

        RowLayout{
            id: mainItm
            anchors.fill: parent
            spacing: 0

            SideBar {
                id: sideBar
                Layout.preferredWidth: 50
                Layout.fillHeight: true
                _model: sidebarModel
                on_SelectedURLChanged: pageLoader.source = _selectedURL
            }
            ColumnLayout {
                Layout.fillWidth: true
                Layout.fillHeight: true
                spacing: 0

                Toolbox {
                    id: annotToolbox
                    Layout.fillWidth: true
                    Layout.preferredHeight: 50
                }
                Loader {
                    id: pageLoader
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                }
            }
        }
    }
}

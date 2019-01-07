import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4
import Qt.labs.folderlistmodel 2.2

Window {
    visible: true
    width: 1000
    height: 500
    title: qsTr("Hello World")

    ColumnLayout {
        anchors.fill: parent
        spacing: 0
        Rectangle {
            color: 'white'
            Layout.fillWidth: true
            Layout.preferredWidth: parent.width
            Layout.preferredHeight: 30

            TextInput {
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                text: "http://"
                autoScroll: true
                font.pixelSize: 12
                height: 14
                width: parent.width - 20
                leftPadding: 10
                color: "grey"
            }

            Rectangle {
                anchors.left: parent.left
                anchors.bottom: parent.bottom
                width: parent.width
                height: 2
                color: "lightgrey"
            }
        }

        Rectangle {
            color: "yellow"
            Layout.fillWidth: true
            Layout.fillHeight: true

            RowLayout {
                anchors.fill: parent
                spacing: 0

                Rectangle {
                    color: "white"
                    Layout.preferredWidth: 200
                    Layout.fillHeight: true

                    FolderListModel {
                        folder: "file:///C:/Program Files"
                        id: fileSystemModel
                    }

                    TreeView {
                        TableViewColumn {
                            title: "Name"
                            role: "fileName"
                            width: 300
                        }
                        TableViewColumn {
                            title: "Permissions"
                            role: "filePermissions"
                            width: 100
                        }
                        model: fileSystemModel

                        anchors.fill: parent
                    }
                }

                Rectangle {
                    color: "green"
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                }
            }
        }
    }

}

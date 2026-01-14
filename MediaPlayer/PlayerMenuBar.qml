// Copyright (C) 2023 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR BSD-3-Clause

import QtQuick
import QtQuick.Controls.Fusion
import QtQuick.Dialogs
import QtCore
import Config

Item {
    id: root

    implicitHeight: menuBar.height

    signal fileOpened(path: url)
    signal multipleFilesOpened(var files)

    property alias openFileMenu: fileDialog
    property alias openMultipleFilesMenu: multipleFilesDialog
    property alias openUrlPopup: urlPopup
    property list<string> nameFilters
    property int selectedNameFilter

    FileDialog {
        id: fileDialog
        currentFolder: StandardPaths.standardLocations(StandardPaths.MoviesLocation)[0]
        nameFilters: root.nameFilters
        selectedNameFilter.index: root.selectedNameFilter
        title: qsTr("Please choose a file")
        onAccepted: root.fileOpened(fileDialog.selectedFile)
    }

    FileDialog {
        id: multipleFilesDialog
        currentFolder: StandardPaths.standardLocations(StandardPaths.MoviesLocation)[0]
        nameFilters: root.nameFilters
        selectedNameFilter.index: root.selectedNameFilter
        fileMode: FileDialog.OpenFiles
        title: qsTr("Please choose up to 4 video files")
        onAccepted: root.multipleFilesOpened(multipleFilesDialog.selectedFiles)
    }

    UrlPopup {
        id: urlPopup
        onPathChanged: root.fileOpened(urlPopup.path)
    }

    MenuBar {
        id: menuBar
        visible: !Config.isMobileTarget
        anchors.left: root.left
        leftPadding: 10
        topPadding: 10

        palette.base: Config.mainColor
        palette.text: Config.secondaryColor
        palette.highlightedText: Config.highlightColor
        palette.window: "transparent"
        palette.highlight: Config.mainColor

        Menu {
            title: qsTr("&File")
            palette.base: Config.mainColor
            palette.text: Config.secondaryColor
            palette.highlight: Config.highlightColor

            MenuItem {
                text: qsTr("Open &File")
                onTriggered: fileDialog.open()
            }
            MenuItem {
                text: qsTr("Open &Multiple Videos")
                onTriggered: multipleFilesDialog.open()
            }
            MenuItem {
                text: qsTr("Open &URL")
                onTriggered: urlPopup.open()
            }
        }
    }
}

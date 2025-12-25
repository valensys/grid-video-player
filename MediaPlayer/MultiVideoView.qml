// Copyright (C) 2023 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR BSD-3-Clause

import QtQuick
import QtQuick.Layouts
import QtMultimedia
import Config

Item {
    id: root

    property var videoSources: []
    property var mediaPlayers: []

    function setVideoSources(sources) {
        // Limit to 4 videos
        var limitedSources = sources.slice(0, Math.min(4, sources.length))
        videoSources = limitedSources
        
        // Set sources for available players and hide unused ones
        for (var i = 0; i < 4; i++) {
            if (i < limitedSources.length) {
                mediaPlayers[i].source = limitedSources[i]
                videoContainers[i].visible = true
            } else {
                mediaPlayers[i].source = ""
                videoContainers[i].visible = false
            }
        }
    }

    function playAll() {
        for (var i = 0; i < videoSources.length; i++) {
            mediaPlayers[i].play()
        }
    }

    function pauseAll() {
        for (var i = 0; i < videoSources.length; i++) {
            mediaPlayers[i].pause()
        }
    }

    function stopAll() {
        for (var i = 0; i < videoSources.length; i++) {
            mediaPlayers[i].stop()
        }
    }

    function setPosition(position) {
        for (var i = 0; i < videoSources.length; i++) {
            mediaPlayers[i].position = position
        }
    }

    GridLayout {
        id: gridLayout
        anchors.fill: parent
        anchors.margins: 5
        columns: root.videoSources.length <= 2 ? root.videoSources.length : 2
        rows: root.videoSources.length <= 2 ? 1 : 2
        
        Rectangle {
            id: container1
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.margins: 5
            color: "black"
            border.color: Config.secondaryColor
            border.width: 1
            radius: 3
            visible: false

            MediaPlayer {
                id: multiMediaPlayer1
                videoOutput: multiVideoOutput1
            }

            VideoOutput {
                id: multiVideoOutput1
                anchors.fill: parent
                anchors.margins: 1
                fillMode: VideoOutput.PreserveAspectFit
            }

            Text {
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.margins: 5
                text: "Video 1"
                color: Config.secondaryColor
                font.pixelSize: 14
                font.bold: true
                style: Text.Outline
                styleColor: "black"
            }
        }

        Rectangle {
            id: container2
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.margins: 5
            color: "black"
            border.color: Config.secondaryColor
            border.width: 1
            radius: 3
            visible: false

            MediaPlayer {
                id: multiMediaPlayer2
                videoOutput: multiVideoOutput2
            }

            VideoOutput {
                id: multiVideoOutput2
                anchors.fill: parent
                anchors.margins: 1
                fillMode: VideoOutput.PreserveAspectFit
            }

            Text {
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.margins: 5
                text: "Video 2"
                color: Config.secondaryColor
                font.pixelSize: 14
                font.bold: true
                style: Text.Outline
                styleColor: "black"
            }
        }

        Rectangle {
            id: container3
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.margins: 5
            color: "black"
            border.color: Config.secondaryColor
            border.width: 1
            radius: 3
            visible: false

            MediaPlayer {
                id: multiMediaPlayer3
                videoOutput: multiVideoOutput3
            }

            VideoOutput {
                id: multiVideoOutput3
                anchors.fill: parent
                anchors.margins: 1
                fillMode: VideoOutput.PreserveAspectFit
            }

            Text {
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.margins: 5
                text: "Video 3"
                color: Config.secondaryColor
                font.pixelSize: 14
                font.bold: true
                style: Text.Outline
                styleColor: "black"
            }
        }

        Rectangle {
            id: container4
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.margins: 5
            color: "black"
            border.color: Config.secondaryColor
            border.width: 1
            radius: 3
            visible: false

            MediaPlayer {
                id: multiMediaPlayer4
                videoOutput: multiVideoOutput4
            }

            VideoOutput {
                id: multiVideoOutput4
                anchors.fill: parent
                anchors.margins: 1
                fillMode: VideoOutput.PreserveAspectFit
            }

            Text {
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.margins: 5
                text: "Video 4"
                color: Config.secondaryColor
                font.pixelSize: 14
                font.bold: true
                style: Text.Outline
                styleColor: "black"
            }
        }
    }

    property var videoContainers: [container1, container2, container3, container4]

    Component.onCompleted: {
        mediaPlayers = [multiMediaPlayer1, multiMediaPlayer2, multiMediaPlayer3, multiMediaPlayer4]
    }
}


import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ApplicationWindow {
    id: window
    width: 1280
    height: 800
    minimumWidth: 900
    minimumHeight: 600
    visible: true
    title: "Blueberry"
    color: "#0a0c18"

    property string activeCategory: "All apps"
    property string statusMessage: "Welcome to Blueberry"
    property var apps: [
        { name: "Files", glyph: "▤", category: "System", tint: "#7899ef" },
        { name: "Settings", glyph: "⚙", category: "System", tint: "#a5a8d9" },
        { name: "Terminal", glyph: ">_", category: "Development", tint: "#72c9bb" },
        { name: "Browser", glyph: "◉", category: "Internet", tint: "#8eafff" },
        { name: "Software", glyph: "✣", category: "System", tint: "#d1a0f2" },
        { name: "Monitor", glyph: "▥", category: "System", tint: "#f0bd78" }
    ]

    Rectangle {
        anchors.fill: parent
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#111a36" }
            GradientStop { position: 0.48; color: "#111126" }
            GradientStop { position: 1.0; color: "#24143c" }
        }
    }

    // Soft ambient shapes establish Blueberry's own visual identity.
    Rectangle {
        width: 540
        height: 540
        radius: width / 2
        x: window.width * 0.49
        y: window.height * 0.12
        opacity: 0.13
        color: "#667dff"
        layer.enabled: true
    }
    Rectangle {
        width: 360
        height: 360
        radius: width / 2
        x: window.width * 0.12
        y: window.height * 0.47
        opacity: 0.10
        color: "#c078f2"
    }

    Rectangle {
        id: topPanel
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        height: 46
        color: "#b0161b35"
        border.color: "#25ffffff"
        border.width: 1

        RowLayout {
            anchors.fill: parent
            anchors.leftMargin: 18
            anchors.rightMargin: 18
            spacing: 12

            Rectangle {
                width: 24
                height: 24
                radius: 8
                color: "#8297ff"
                Text {
                    anchors.centerIn: parent
                    text: "b"
                    color: "#10152b"
                    font.pixelSize: 18
                    font.bold: true
                }
            }

            Label {
                text: "blueberry"
                color: "#f2f3ff"
                font.pixelSize: 15
                font.weight: Font.DemiBold
            }

            Label {
                text: "Desktop preview"
                color: "#9da9d2"
                font.pixelSize: 12
            }

            Item { Layout.fillWidth: true }

            Label {
                text: "●  Prototype session"
                color: "#a9cfc7"
                font.pixelSize: 12
            }

            Label {
                id: clock
                text: Qt.formatDateTime(new Date(), "ddd  h:mm AP")
                color: "#f0f1ff"
                font.pixelSize: 12

                Timer {
                    interval: 15000
                    running: true
                    repeat: true
                    onTriggered: clock.text = Qt.formatDateTime(new Date(), "ddd  h:mm AP")
                }
            }
        }
    }

    ColumnLayout {
        anchors.top: topPanel.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: 36
        spacing: 18

        Item { Layout.fillHeight: true; Layout.preferredHeight: 18 }

        ColumnLayout {
            Layout.alignment: Qt.AlignHCenter
            spacing: 8

            Rectangle {
                Layout.alignment: Qt.AlignHCenter
                width: 76
                height: 76
                radius: 26
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "#9baaff" }
                    GradientStop { position: 1.0; color: "#8759d6" }
                }

                // A simple custom berry mark, drawn from circles.
                Repeater {
                    model: [
                        { x: 20, y: 18 }, { x: 35, y: 16 }, { x: 49, y: 22 },
                        { x: 16, y: 33 }, { x: 31, y: 32 }, { x: 46, y: 36 },
                        { x: 25, y: 47 }, { x: 39, y: 48 }
                    ]
                    delegate: Rectangle {
                        required property var modelData
                        x: modelData.x
                        y: modelData.y
                        width: 13
                        height: 13
                        radius: 6
                        color: "#24274c"
                        opacity: 0.86
                    }
                }
                Rectangle {
                    x: 34
                    y: 8
                    width: 9
                    height: 13
                    radius: 5
                    rotation: 35
                    color: "#a5e1b2"
                }
            }

            Label {
                Layout.alignment: Qt.AlignHCenter
                text: "A little more you."
                color: "#f5f4ff"
                font.pixelSize: 34
                font.weight: Font.Light
            }

            Label {
                Layout.alignment: Qt.AlignHCenter
                text: "Welcome to Blueberry"
                color: "#b3b9df"
                font.pixelSize: 15
            }

            Label {
                Layout.alignment: Qt.AlignHCenter
                text: statusMessage
                color: "#93a2ce"
                font.pixelSize: 12
            }
        }

        Item { Layout.fillHeight: true; Layout.preferredHeight: 12 }

        Rectangle {
            Layout.alignment: Qt.AlignHCenter
            Layout.maximumWidth: 760
            Layout.fillWidth: true
            Layout.preferredHeight: 250
            radius: 24
            color: "#a10b1025"
            border.color: "#32ffffff"
            border.width: 1

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 22
                spacing: 14

                RowLayout {
                    Layout.fillWidth: true
                    Label {
                        text: "Your space"
                        color: "#f2f3ff"
                        font.pixelSize: 18
                        font.weight: Font.DemiBold
                    }
                    Item { Layout.fillWidth: true }
                    Label {
                        text: "APP PREVIEW"
                        color: "#8997c9"
                        font.pixelSize: 10
                        font.letterSpacing: 1.4
                    }
                }

                GridLayout {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    columns: 3
                    rowSpacing: 10
                    columnSpacing: 10

                    Repeater {
                        model: apps
                        delegate: Rectangle {
                            id: appTile
                            required property var modelData
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            radius: 16
                            color: mouse.containsMouse ? "#382f5b" : "#251d3d"
                            border.color: mouse.containsMouse ? "#7d8fff" : "#24ffffff"
                            border.width: 1

                            Behavior on color { ColorAnimation { duration: 120 } }

                            Column {
                                anchors.centerIn: parent
                                spacing: 8
                                Rectangle {
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    width: 42
                                    height: 42
                                    radius: 13
                                    color: appTile.modelData.tint
                                    Text {
                                        anchors.centerIn: parent
                                        text: appTile.modelData.glyph
                                        color: "#161a33"
                                        font.pixelSize: 21
                                        font.bold: true
                                    }
                                }
                                Text {
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    text: appTile.modelData.name
                                    color: "#f0f1ff"
                                    font.pixelSize: 13
                                }
                            }

                            MouseArea {
                                id: mouse
                                anchors.fill: parent
                                hoverEnabled: true
                                cursorShape: Qt.PointingHandCursor
                                onClicked: statusMessage = appTile.modelData.name + " is a UI placeholder for now."
                            }
                        }
                    }
                }
            }
        }

        RowLayout {
            Layout.alignment: Qt.AlignHCenter
            spacing: 10

            Button {
                text: "Explore apps"
                onClicked: statusMessage = "App launcher prototype selected."
                background: Rectangle {
                    radius: 12
                    color: "#91a3ff"
                }
                contentItem: Text {
                    text: parent.text
                    color: "#11152e"
                    font.pixelSize: 13
                    font.bold: true
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }

            Button {
                text: "Personalize"
                onClicked: statusMessage = "Appearance settings are coming in a future milestone."
                background: Rectangle {
                    radius: 12
                    color: "#402d55"
                    border.color: "#45ffffff"
                }
                contentItem: Text {
                    text: parent.text
                    color: "#f0eaff"
                    font.pixelSize: 13
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }
        }

        Item { Layout.fillHeight: true; Layout.preferredHeight: 12 }
    }

    Label {
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.leftMargin: 18
        anchors.bottomMargin: 12
        text: "BLUEBERRY OS  •  EARLY DEVELOPMENT"
        color: "#6875a8"
        font.pixelSize: 10
        font.letterSpacing: 1.1
    }
}

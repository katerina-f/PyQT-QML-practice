
import QtQuick 2.13
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.2

ApplicationWindow {
    id: mainWindow
    visible: true
    minimumWidth: 500
    minimumHeight: 500
    maximumWidth: 800
    maximumHeight: 800
    title: "Hello!"
    color: "white"

    Rectangle {
        id: body
        width: parent.width*0.8
        height: parent.height*0.6

        ProfileForm {
        id: profile
        anchors.fill: body
        }

        Text {
            id: time_today
            anchors.top: profile.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 30
            text: change_date.date
        }
        Text {
            id: date_today
            anchors.top: time_today.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 30
            text: change_date.time
        }
    }

    MyButton {
        id: button
        }

    UserProfile {
        id: userProfile
        title: 'Profile'

        onSignalExit: {
            user_profile.open = ''
            user_profile.count = '0:00:00'
            userProfile.close()
            mainWindow.show()
        }
    }

    Connections {
        target: user_profile

        onUser_profile: {
            userProfile.first_name.text = name
            userProfile.last_name.text = surname
            userProfile.age.text = age+' years old'
            userProfile.image.source = avatar
            userProfile.about.text = info
            userProfile.show()
        }
    }
}

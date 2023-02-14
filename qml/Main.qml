/*
 * 2023  Ivo Xavier
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 3.
 *
 * QuickWords is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */


import QtQuick 2.9
import Lomiri.Components 1.3
import Lomiri.Components.Popups 1.3
import Lomiri.Components.Pickers 1.3
import Lomiri.Components.ListItems 1.3 as ListItem
import QtQuick.Layouts 1.3
import Qt.labs.settings 1.0
import QtQuick.Controls.Suru 2.2
import QtQuick.LocalStorage 2.12
import io.thp.pyotherside 1.5



MainView {
    id: root
    objectName: 'mainView'
    applicationName: 'quickwords.ivoxavier'
    automaticOrientation: false
    anchorToKeyboard: true
    width: units.gu(45)
    height: units.gu(75)


    property var wordsList : []
    

    function getRandomWord(max){
        wordsList_label.text = wordsList[(Math.floor(Math.random() * max))] 
    }

    Style{id:app_style}

    Component{
        id: add_word_dialog
        WordInputDialog{}
    }


    Text{
        id: wordsList_label
        anchors.fill: parent
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        font.pixelSize: units.gu(5)
        font.bold: true
        color: app_style.label.labelColor 
    }


    MouseArea{
        anchors.fill: parent
        onPressed: timer.stop()   
        onReleased: timer.start()      
    }
    
    
    Timer{
        id:timer;
        repeat: true
        interval: 30
        onTriggered: getRandomWord(wordsList.length)
    }   

    Component.onCompleted:{
        PopupUtils.open(add_word_dialog)
    }
}
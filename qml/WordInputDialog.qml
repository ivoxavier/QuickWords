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


Dialog{
    id: add_word_dialog
    title: i18n.tr("QuickWords")

    Label{
        text: i18n.tr("Add a Word, each time")
        color: app_style.label.labelColor
    }

    LomiriShape{
        width : parent.width
        height : units.gu(10)
        radius: "large"
        aspect: LomiriShape.Inset

        TextInput{
            id: input_text
            anchors.fill: parent
            overwriteMode: true
            horizontalAlignment: TextInput.AlignHCenter
            verticalAlignment: TextInput.AlignVCenter
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            color : app_style.label.labelColor  
        }
    }

    Button {
        text: i18n.tr("Reset Words")
        color: app_style.button.deleteButton.buttonColor 
        onClicked:{
            root.wordsList = []
        } 
    }
    
    Button {
        text: i18n.tr("Add")
        color: app_style.button.actionButton.buttonColor 
        onClicked:{
            root.wordsList.push(input_text.text)
            input_text.text = ""
        } 
    }

    Button {
        text: i18n.tr("Play")
        color: app_style.button.confirmButton.buttonColor 
        onClicked:{
            timer.start()
            PopupUtils.close(add_word_dialog)
        } 
    }
}

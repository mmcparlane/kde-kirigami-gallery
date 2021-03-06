

import QtQuick 2.6
import QtQuick.Layouts 1.2
import QtQuick.Controls 2.2
import org.kde.kirigami 2.4 as Kirigami
import "components"

Kirigami.ScrollablePage {
    id: page
    title: "Form Layout"

    actions.main: Kirigami.Action {
        iconName: "documentinfo"
        text: qsTr("Info")
        checkable: true
        onCheckedChanged: sheet.sheetOpen = checked;
        shortcut: "Alt+I"
    }

    //Close the drawer with the back button
    onBackRequested: {
        if (sheet.sheetOpen) {
            event.accepted = true;
            sheet.close();
        }
    }

    InfoSheet {
        id: sheet

        page: page
        component: "FormLayoutGallery"
    }

    Kirigami.FormLayout {
        id: layout

        TextField {
            Kirigami.FormData.label: "Label:"
        }
        TextField {
        }
        TextField {
            Kirigami.FormData.label:"Lo&nger label:"
        }
        Kirigami.Separator {
            Kirigami.FormData.isSection: true
        }
        TextField {
            Kirigami.FormData.label: "After separator:"
        }
        ComboBox {
            Kirigami.FormData.label: "Combo:"
            model: ["First", "Second", "Third"]
        }
        CheckBox {
            checked: true
            text: "Option"
        }
        Kirigami.Separator {
            Kirigami.FormData.isSection: true
            Kirigami.FormData.label: "Section title"
        }
        TextField {
            Kirigami.FormData.label: "Label:"
        }
        Item {
            Kirigami.FormData.isSection: true
        }
        TextField {
            Kirigami.FormData.label: "Section without line:"
        }
        Button {
            text: qsTr("Expanding Button")
            Layout.fillWidth: true
        }
        Item {
            Kirigami.FormData.isSection: true
            Kirigami.FormData.label: "Section with title without line"
        }
        TextField {
            Kirigami.FormData.label: "Title:"
        }
        TextField {
            Kirigami.FormData.label: "Checkable label"
            Kirigami.FormData.checkable: true
            enabled: Kirigami.FormData.checked
        }
        ColumnLayout {
            Layout.rowSpan: 3
            Kirigami.FormData.label: "Label for radios:"
            Kirigami.FormData.buddyFor: firstRadio
            RadioButton {
                id: firstRadio
                checked: true
                text: "One"
            }
            RadioButton {
                text: "Two"
            }
            RadioButton {
                text: "Three"
            }
        }
        Button {
            text: item ? "Remove Field" : "Add Field"
            property TextField item
            onClicked: {
                if (item) {
                    item.destroy();
                } else {
                    item = dyncomponent.createObject(layout);
                }
            }
            Component {
                id: dyncomponent
                TextField {
                    Kirigami.FormData.label: "Generated Title:"
                }
            }
        }
    }
}

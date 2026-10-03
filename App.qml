import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

ApplicationWindow {
    id: window
    width: 1180
    height: 720
    visible: true
    title: I18n.tr("app_title")
    color: "#1e1e2e" // Omarchy Dark Theme

    // Componente de atalhos de teclado globais
    Item {
        id: globalShortcuts
        focus: true
        
        Keys.onPressed: (event) => {
            if (event.key === Qt.Key_1) { sidebar.currentIndex = 0; }
            else if (event.key === Qt.Key_2) { sidebar.currentIndex = 1; }
            else if (event.key === Qt.Key_3) { sidebar.currentIndex = 2; }
            else if (event.key === Qt.Key_4) { sidebar.currentIndex = 3; }
            else if (event.key === Qt.Key_5) { sidebar.currentIndex = 4; }
            else if (event.key === Qt.Key_6) { sidebar.currentIndex = 5; }
            else if (event.key === Qt.Key_7) { sidebar.currentIndex = 6; }
            else if (event.key === Qt.Key_8) { sidebar.currentIndex = 7; }
            else if (event.key === Qt.Key_9) { sidebar.currentIndex = 8; }
            else if (event.key === Qt.Key_N) { newTransactionModal.open(); }
            else if (event.key === Qt.Key_Slash) { searchBar.forceActiveFocus(); }
        }
    }

    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        // Barra Superior / Header
        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 56
            color: "#181825"

            RowLayout {
                anchors.fill: parent
                anchors.leftMargin: 16
                anchors.rightMargin: 16
                spacing: 12

                Text {
                    text: "📊 Omabudget Brasil"
                    color: "#cdd6f4"
                    font.pixelSize: 18
                    font.bold: true
                }

                Item { Layout.fillWidth: true }

                // Botão de busca rápida
                Button {
                    id: searchBtn
                    text: I18n.tr("btn_search")
                    onClicked: searchBar.forceActiveFocus()
                    background: Rectangle {
                        color: "#313244"
                        radius: 6
                    }
                    contentItem: Text {
                        text: searchBtn.text
                        color: "#cdd6f4"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                }

                // Botão de Nova Transação
                Button {
                    id: addTxBtn
                    text: I18n.tr("btn_add_transaction")
                    onClicked: newTransactionModal.open()
                    background: Rectangle {
                        color: "#89b4fa"
                        radius: 6
                    }
                    contentItem: Text {
                        text: addTxBtn.text
                        color: "#11111b"
                        font.bold: true
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                }

                // Seletor Dinâmico de Idioma (PT-BR / EN)
                Button {
                    id: langToggleBtn
                    text: I18n.currentLanguage === "PT-BR" ? "🇧🇷 PT-BR" : "🇺🇸 EN"
                    onClicked: I18n.toggleLanguage()
                    background: Rectangle {
                        color: "#45475a"
                        radius: 6
                        border.color: "#89b4fa"
                        border.width: 1
                    }
                    contentItem: Text {
                        text: langToggleBtn.text
                        color: "#f5e0dc"
                        font.bold: true
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                    ToolTip.visible: hovered
                    ToolTip.text: "Alternar Idioma / Switch Language"
                }
            }
        }

        // Conteúdo Principal: Sidebar + Visualização das Telas
        RowLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            spacing: 0

            // Sidebar / Menu de Navegação Lateral
            Rectangle {
                Layout.preferredWidth: 220
                Layout.fillHeight: true
                color: "#181825"

                ListView {
                    id: sidebar
                    anchors.fill: parent
                    anchors.topMargin: 12
                    currentIndex: 0

                    model: ListModel {
                        ListElement { key: "menu_dashboard"; icon: "dashboard" }
                        ListElement { key: "menu_accounts"; icon: "account" }
                        ListElement { key: "menu_ledger"; icon: "receipt" }
                        ListElement { key: "menu_budget"; icon: "chart" }
                        ListElement { key: "menu_bills"; icon: "calendar" }
                        ListElement { key: "menu_reports"; icon: "analytics" }
                        ListElement { key: "menu_manage"; icon: "folder" }
                        ListElement { key: "menu_alerts"; icon: "bell" }
                        ListElement { key: "menu_settings"; icon: "settings" }
                    }

                    delegate: ItemDelegate {
                        width: sidebar.width
                        height: 42
                        highlighted: ListView.isCurrentItem

                        background: Rectangle {
                            color: highlighted ? "#313244" : "transparent"
                            radius: 4
                        }

                        contentItem: Text {
                            text: I18n.tr(model.key)
                            color: highlighted ? "#89b4fa" : "#a6adc8"
                            font.pixelSize: 14
                            font.bold: highlighted
                            verticalAlignment: Text.AlignVCenter
                            leftPadding: 16
                        }

                        onClicked: sidebar.currentIndex = index
                    }
                }
            }

            // Área do Conteúdo da Tela Selecionada
            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true
                color: "#1e1e2e"

                StackLayout {
                    anchors.fill: parent
                    anchors.margins: 20
                    currentIndex: sidebar.currentIndex

                    // 1. Painel / Dashboard
                    ColumnLayout {
                        spacing: 16
                        Text {
                            text: I18n.tr("menu_dashboard")
                            color: "#cdd6f4"
                            font.pixelSize: 22
                            font.bold: true
                        }

                        RowLayout {
                            spacing: 16
                            Rectangle {
                                width: 220; height: 100; color: "#313244"; radius: 8
                                ColumnLayout {
                                    anchors.centerIn: parent
                                    Text { text: I18n.tr("total_balance"); color: "#a6adc8"; font.pixelSize: 12 }
                                    Text { text: "R$ 15.420,50"; color: "#a6e3a1"; font.pixelSize: 20; font.bold: true }
                                }
                            }
                            Rectangle {
                                width: 220; height: 100; color: "#313244"; radius: 8
                                ColumnLayout {
                                    anchors.centerIn: parent
                                    Text { text: I18n.tr("income"); color: "#a6adc8"; font.pixelSize: 12 }
                                    Text { text: "R$ 6.500,00"; color: "#89b4fa"; font.pixelSize: 20; font.bold: true }
                                }
                            }
                            Rectangle {
                                width: 220; height: 100; color: "#313244"; radius: 8
                                ColumnLayout {
                                    anchors.centerIn: parent
                                    Text { text: I18n.tr("expenses"); color: "#a6adc8"; font.pixelSize: 12 }
                                    Text { text: "R$ 2.180,30"; color: "#f38ba8"; font.pixelSize: 20; font.bold: true }
                                }
                            }
                        }
                        Item { Layout.fillHeight: true }
                    }

                    // 2. Contas
                    Text { text: I18n.tr("menu_accounts"); color: "#cdd6f4"; font.pixelSize: 22 }

                    // 3. Extrato
                    Text { text: I18n.tr("menu_ledger"); color: "#cdd6f4"; font.pixelSize: 22 }

                    // 4. Orçamento (Demonstrando Categorias Traduzidas Dinamicamente)
                    ColumnLayout {
                        spacing: 16
                        Text { text: I18n.tr("menu_budget"); color: "#cdd6f4"; font.pixelSize: 22; font.bold: true }

                        ListView {
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            model: ListModel {
                                ListElement { parentCat: "Salary"; subCat: "Primary Salary"; planned: "5000.00" }
                                ListElement { parentCat: "Salary"; subCat: "Bonus"; planned: "1500.00" }
                                ListElement { parentCat: "Housing"; subCat: "Rent"; planned: "1200.00" }
                                ListElement { parentCat: "Food"; subCat: "Groceries"; planned: "800.00" }
                                ListElement { parentCat: "Transportation"; subCat: "Fuel"; planned: "350.00" }
                            }
                            delegate: Rectangle {
                                width: parent.width; height: 40; color: "#313244"; radius: 6
                                RowLayout {
                                    anchors.fill: parent; anchors.margins: 10
                                    Text { 
                                        text: I18n.trCategory(model.parentCat) + " > " + I18n.trCategory(model.subCat)
                                        color: "#cdd6f4"; font.pixelSize: 14 
                                    }
                                    Item { Layout.fillWidth: true }
                                    Text { text: "R$ " + model.planned; color: "#a6e3a1"; font.bold: true }
                                }
                            }
                        }
                    }

                    // 5. Contas Fixas
                    Text { text: I18n.tr("menu_bills"); color: "#cdd6f4"; font.pixelSize: 22 }

                    // 6. Relatórios
                    Text { text: I18n.tr("menu_reports"); color: "#cdd6f4"; font.pixelSize: 22 }

                    // 7. GERENCIAR (Com Abas e Botões Traduzidos Dinamicamente)
                    ColumnLayout {
                        spacing: 16
                        
                        ColumnLayout {
                            spacing: 4
                            Text { 
                                text: I18n.tr("manage_title")
                                color: "#cdd6f4"
                                font.pixelSize: 22
                                font.bold: true 
                            }
                            Text { 
                                text: I18n.tr("manage_subtitle")
                                color: "#a6adc8"
                                font.pixelSize: 13 
                            }
                        }

                        // Bar de Abas de Gerenciamento (Categorias, Beneficiários, Cotações/Taxas, Alertas)
                        TabBar {
                            id: manageTabBar
                            Layout.fillWidth: true
                            background: Rectangle { color: "#181825"; radius: 6 }

                            TabButton {
                                text: I18n.tr("tab_categories")
                                width: implicitWidth + 20
                            }
                            TabButton {
                                text: I18n.tr("tab_payees")
                                width: implicitWidth + 20
                            }
                            TabButton {
                                text: I18n.tr("tab_rates")
                                width: implicitWidth + 20
                            }
                            TabButton {
                                text: I18n.tr("tab_alerts")
                                width: implicitWidth + 20
                            }
                        }

                        // Conteúdo da Aba Selecionada
                        StackLayout {
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            currentIndex: manageTabBar.currentIndex

                            // Aba 1: Categorias e Subcategorias
                            ColumnLayout {
                                spacing: 12
                                RowLayout {
                                    Text { text: I18n.tr("manage_categories_desc"); color: "#a6adc8" }
                                    Item { Layout.fillWidth: true }
                                    Button {
                                        text: I18n.tr("btn_add_category")
                                        background: Rectangle { color: "#89b4fa"; radius: 4 }
                                    }
                                }
                                Rectangle {
                                    Layout.fillWidth: true; Layout.fillHeight: true; color: "#24273a"; radius: 8
                                    Text { anchors.centerIn: parent; text: I18n.tr("tab_categories") + " (" + I18n.currentLanguage + ")"; color: "#cdd6f4" }
                                }
                            }

                            // Aba 2: Beneficiários / Favorecidos
                            ColumnLayout {
                                spacing: 12
                                RowLayout {
                                    Text { text: I18n.tr("manage_payees_desc"); color: "#a6adc8" }
                                    Item { Layout.fillWidth: true }
                                    Button {
                                        text: I18n.tr("btn_add_payee")
                                        background: Rectangle { color: "#89b4fa"; radius: 4 }
                                    }
                                }
                                Rectangle {
                                    Layout.fillWidth: true; Layout.fillHeight: true; color: "#24273a"; radius: 8
                                    Text { anchors.centerIn: parent; text: I18n.tr("tab_payees") + " (" + I18n.currentLanguage + ")"; color: "#cdd6f4" }
                                }
                            }

                            // Aba 3: Cotações, Taxas e Moedas
                            ColumnLayout {
                                spacing: 12
                                RowLayout {
                                    Text { text: I18n.tr("manage_rates_desc"); color: "#a6adc8" }
                                    Item { Layout.fillWidth: true }
                                    Button {
                                        text: I18n.tr("btn_add_rate")
                                        background: Rectangle { color: "#89b4fa"; radius: 4 }
                                    }
                                }
                                Rectangle {
                                    Layout.fillWidth: true; Layout.fillHeight: true; color: "#24273a"; radius: 8
                                    Text { anchors.centerIn: parent; text: I18n.tr("tab_rates") + " (" + I18n.currentLanguage + ")"; color: "#cdd6f4" }
                                }
                            }

                            // Aba 4: Alertas e Notificações
                            ColumnLayout {
                                spacing: 12
                                RowLayout {
                                    Text { text: I18n.tr("manage_alerts_desc"); color: "#a6adc8" }
                                    Item { Layout.fillWidth: true }
                                    Button {
                                        text: I18n.tr("btn_add_alert")
                                        background: Rectangle { color: "#89b4fa"; radius: 4 }
                                    }
                                }
                                Rectangle {
                                    Layout.fillWidth: true; Layout.fillHeight: true; color: "#24273a"; radius: 8
                                    Text { anchors.centerIn: parent; text: I18n.tr("tab_alerts") + " (" + I18n.currentLanguage + ")"; color: "#cdd6f4" }
                                }
                            }
                        }
                    }

                    // 8. Alertas Globais
                    Text { text: I18n.tr("menu_alerts"); color: "#cdd6f4"; font.pixelSize: 22 }

                    // 9. Configurações
                    ColumnLayout {
                        spacing: 16
                        Text { text: I18n.tr("menu_settings"); color: "#cdd6f4"; font.pixelSize: 22; font.bold: true }

                        RowLayout {
                            spacing: 12
                            Text { text: I18n.tr("settings_language") + ":"; color: "#cdd6f4"; font.pixelSize: 14 }
                            Button {
                                text: I18n.currentLanguage === "PT-BR" ? "Mudar para English (EN)" : "Mudar para Português (PT-BR)"
                                onClicked: I18n.toggleLanguage()
                            }
                        }
                        Item { Layout.fillHeight: true }
                    }
                }
            }
        }
    }

    // Modal de Nova Transação
    Dialog {
        id: newTransactionModal
        title: I18n.tr("btn_add_transaction")
        standardButtons: Dialog.Save | Dialog.Cancel
        anchors.centerIn: parent
        modal: true

        ColumnLayout {
            spacing: 10
            TextField { placeholderText: "Descrição / Description"; Layout.fillWidth: true }
            TextField { placeholderText: "Valor / Amount (R$)"; Layout.fillWidth: true }
        }
    }
}

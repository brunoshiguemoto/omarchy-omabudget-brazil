import QtQuick 2.15

pragma Singleton

Item {
    id: i18n

    // Idioma selecionado: "PT-BR" ou "EN"
    property string currentLanguage: "PT-BR"

    function setLanguage(lang) {
        if (lang === "PT-BR" || lang === "EN") {
            currentLanguage = lang;
        }
    }

    function toggleLanguage() {
        currentLanguage = (currentLanguage === "PT-BR") ? "EN" : "PT-BR";
    }

    readonly property var translations: ({
        "PT-BR": {
            // General / Navegação
            "app_title": "Omabudget Brasil - Finanças Pessoais Local-First",
            "menu_dashboard": "1. Painel",
            "menu_accounts": "2. Contas",
            "menu_ledger": "3. Extrato",
            "menu_budget": "4. Orçamento",
            "menu_bills": "5. Contas Fixas",
            "menu_reports": "6. Relatórios",
            "menu_manage": "7. Gerenciar",
            "menu_alerts": "8. Alertas",
            "menu_settings": "9. Configurações",

            // Ações / Botões
            "btn_add_transaction": "Nova Transação (n)",
            "btn_add_account": "Nova Conta",
            "btn_add_budget": "Novo Orçamento",
            "btn_add_bill": "Nova Conta Fixa",
            "btn_save": "Salvar",
            "btn_cancel": "Cancelar",
            "btn_delete": "Excluir",
            "btn_edit": "Editar",
            "btn_search": "Buscar (/)",
            "btn_toggle_lang": "PT-BR 🇧🇷",

            // Termos Financeiros
            "total_balance": "Saldo Total",
            "income": "Receitas",
            "expenses": "Despesas",
            "net_worth": "Patrimônio Líquido",
            "category": "Categoria",
            "account": "Conta",
            "date": "Data",
            "amount": "Valor",
            "description": "Descrição",
            "status": "Status",

            // Configurações
            "language_setting": "Idioma da Interface",
            "currency_setting": "Moeda Principal (BRL / R$)",
            "database_path": "Caminho do Banco de Dados",
            "backup_now": "Fazer Backup Agora"
        },
        "EN": {
            // General / Navigation
            "app_title": "Omabudget Brazil - Local-First Personal Finance",
            "menu_dashboard": "1. Dashboard",
            "menu_accounts": "2. Accounts",
            "menu_ledger": "3. Ledger",
            "menu_budget": "4. Budget",
            "menu_bills": "5. Bills",
            "menu_reports": "6. Reports",
            "menu_manage": "7. Manage",
            "menu_alerts": "8. Alerts",
            "menu_settings": "9. Settings",

            // Actions / Buttons
            "btn_add_transaction": "New Transaction (n)",
            "btn_add_account": "New Account",
            "btn_add_budget": "New Budget",
            "btn_add_bill": "New Bill",
            "btn_save": "Save",
            "btn_cancel": "Cancel",
            "btn_delete": "Delete",
            "btn_edit": "Edit",
            "btn_search": "Search (/)",
            "btn_toggle_lang": "EN 🇺🇸",

            // Financial Terms
            "total_balance": "Total Balance",
            "income": "Income",
            "expenses": "Expenses",
            "net_worth": "Net Worth",
            "category": "Category",
            "account": "Account",
            "date": "Date",
            "amount": "Amount",
            "description": "Description",
            "status": "Status",

            // Settings
            "language_setting": "Interface Language",
            "currency_setting": "Primary Currency (USD / $)",
            "database_path": "Database Path",
            "backup_now": "Backup Now"
        }
    })

    function tr(key) {
        if (translations[currentLanguage] && translations[currentLanguage][key]) {
            return translations[currentLanguage][key];
        }
        if (translations["EN"][key]) {
            return translations["EN"][key];
        }
        return key;
    }
}

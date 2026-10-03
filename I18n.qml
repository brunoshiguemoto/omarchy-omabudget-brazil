import QtQuick 2.15

pragma Singleton

Item {
    id: i18n

    // Idioma atual: "PT-BR" (Padrão) ou "EN"
    property string currentLanguage: "PT-BR"

    // Alterna o idioma entre Português e Inglês
    function toggleLanguage() {
        if (currentLanguage === "PT-BR") {
            currentLanguage = "EN";
        } else {
            currentLanguage = "PT-BR";
        }
    }

    // Define o idioma explicitamente ("PT-BR" ou "EN")
    function setLanguage(lang) {
        if (lang === "EN" || lang === "PT-BR") {
            currentLanguage = lang;
        }
    }

    // Dicionário Completo de Traduções (EN e PT-BR)
    readonly property var translations: ({
        "EN": {
            // Aplicação e Título
            "app_title": "Omabudget Brasil - Local-First Finance",
            "total_balance": "Total Balance",
            "income": "Income",
            "expenses": "Expenses",

            // Navegação e Trilho Lateral (1 a 9)
            "menu_dashboard": "Dashboard",
            "menu_accounts": "Accounts",
            "menu_ledger": "Ledger",
            "menu_budget": "Budget",
            "menu_bills": "Bills",
            "menu_reports": "Reports",
            "menu_manage": "Manage",
            "menu_alerts": "Alerts",
            "menu_settings": "Settings",

            // Seção GERENCIAR (Manage Sub-components & Tabs)
            "manage_title": "Data Management",
            "manage_subtitle": "Manage categories, payees, currency rates, and system alerts",
            "tab_categories": "Categories",
            "tab_payees": "Payees & Beneficiaries",
            "tab_rates": "Exchange Rates & Taxes",
            "tab_alerts": "Alerts & Triggers",
            
            "manage_categories_desc": "Configure income and expense categories and subcategories",
            "manage_payees_desc": "Manage frequent stores, clients, and transaction counterparties",
            "manage_rates_desc": "Set currency exchange sources (BCB, Dollar, Euro) and tax rates",
            "manage_alerts_desc": "Configure custom budget limits, low balance warnings, and due bill alerts",

            "btn_add_category": "New Category",
            "btn_add_payee": "New Payee",
            "btn_add_rate": "Add Currency Rate",
            "btn_add_alert": "New Alert",

            // Botões e Ações Globais
            "btn_search": "Search (/) ",
            "btn_add_transaction": "+ New Transaction (N)",
            "btn_quick_add": "Quick Add (N)",
            "btn_hide_amounts": "Hide Amounts (H)",
            "btn_fetch_rates": "Fetch Rates Now",
            "btn_build_now": "Build Now",
            "btn_save": "Save Changes",
            "btn_cancel": "Cancel",
            "btn_delete": "Delete",
            "btn_edit": "Edit",
            "btn_undo": "Undo",
            "btn_reconcile": "Reconcile",
            "btn_lang_toggle": "Language: EN 🇺🇸",

            // Contas (Accounts)
            "acc_title": "Financial Accounts",
            "acc_checking": "Checking Account",
            "acc_savings": "Savings Account",
            "acc_cash": "Physical Cash",
            "acc_credit": "Credit Card",
            "acc_loans": "Loans & Debts",
            "acc_investments": "Investment Portfolio",
            "acc_low_balance": "Low Balance Threshold",

            // Extrato e Ledger
            "ledger_title": "Transactions & Ledger",
            "ledger_search_placeholder": "Search (e.g. tag:weekly payee:market >50)",
            "ledger_expense": "Expense",
            "ledger_income": "Income",
            "ledger_transfer": "Transfer",
            "ledger_payee": "Payee / Counterparty",
            "ledger_category": "Category",
            "ledger_notes": "Notes / Tags",
            "ledger_recycle_bin": "Recycle Bin (30 days)",

            // Orçamento (Budget)
            "budget_title": "Budget & Envelopes",
            "budget_planned": "Planned",
            "budget_spent": "Spent",
            "budget_remaining": "Remaining",
            "budget_copy_last": "Copy Last Month (c)",
            "budget_average": "Historical Average (v)",
            "budget_median": "Median (m)",
            "budget_scale": "Scale (+/-)",

            // Contas Fixas (Bills)
            "bills_title": "Recurring Bills",
            "bills_due": "Due Soon",
            "bills_overdue": "Overdue",
            "bills_auto_post": "Auto-Post On Due Date",

            // Relatórios (Reports)
            "reports_title": "Financial Reports & Insights",
            "reports_runway": "Financial Runway",
            "reports_daily_avg": "Daily Avg Expense",

            // Configurações
            "settings_title": "System Settings",
            "settings_language": "Application Language",
            "settings_base_currency": "Base Currency (BRL / USD)",
            "settings_rate_source": "Exchange Rate API Source",
            "settings_mcp": "MCP AI Agent Endpoint"
        },
        "PT-BR": {
            // Aplicação e Título
            "app_title": "Omabudget Brasil - Finanças Local-First",
            "total_balance": "Saldo Total",
            "income": "Receitas",
            "expenses": "Despesas",

            // Navegação e Trilho Lateral (1 a 9)
            "menu_dashboard": "Painel",
            "menu_accounts": "Contas",
            "menu_ledger": "Extrato",
            "menu_budget": "Orçamento",
            "menu_bills": "Contas Fixas",
            "menu_reports": "Relatórios",
            "menu_manage": "Gerenciar",
            "menu_alerts": "Alertas",
            "menu_settings": "Configurações",

            // Seção GERENCIAR (Subcomponentes e Abas de Gerenciamento)
            "manage_title": "Gerenciamento de Dados",
            "manage_subtitle": "Gerencie categorias, beneficiários, cotações de moedas e alertas do sistema",
            "tab_categories": "Categorias",
            "tab_payees": "Beneficiários e Favorecidos",
            "tab_rates": "Cotações e Taxas",
            "tab_alerts": "Alertas e Gatilhos",
            
            "manage_categories_desc": "Configure as categorias e subcategorias de receitas e despesas",
            "manage_payees_desc": "Cadastre lojas, estabelecimentos, clientes e favorecidos frequentes",
            "manage_rates_desc": "Configure fontes de cotação de câmbio (Banco Central, Dólar, Euro) e taxas",
            "manage_alerts_desc": "Configure limites de orçamento, avisos de saldo mínimo e contas prestes a vencer",

            "btn_add_category": "Nova Categoria",
            "btn_add_payee": "Novo Beneficiário",
            "btn_add_rate": "Adicionar Cotação",
            "btn_add_alert": "Novo Alerta",

            // Botões e Ações Globais
            "btn_search": "Buscar (/)",
            "btn_add_transaction": "+ Nova Transação (N)",
            "btn_quick_add": "Adicionar Rápido (N)",
            "btn_hide_amounts": "Ocultar Valores (H)",
            "btn_fetch_rates": "Atualizar Cotações",
            "btn_build_now": "Compilar Agora",
            "btn_save": "Salvar Alterações",
            "btn_cancel": "Cancelar",
            "btn_delete": "Excluir",
            "btn_edit": "Editar",
            "btn_undo": "Desfazer",
            "btn_reconcile": "Reconciliar",
            "btn_lang_toggle": "Idioma: PT-BR 🇧🇷",

            // Contas (Accounts)
            "acc_title": "Contas Financeiras",
            "acc_checking": "Conta Corrente",
            "acc_savings": "Poupança",
            "acc_cash": "Dinheiro em Espécie",
            "acc_credit": "Cartão de Crédito",
            "acc_loans": "Empréstimos e Dívidas",
            "acc_investments": "Carteira de Investimentos",
            "acc_low_balance": "Alerta de Saldo Mínimo",

            // Extrato e Ledger
            "ledger_title": "Extrato de Transações",
            "ledger_search_placeholder": "Buscar (ex: tag:semanal payee:mercado >50)",
            "ledger_expense": "Despesa",
            "ledger_income": "Receita",
            "ledger_transfer": "Transferência",
            "ledger_payee": "Favorecido / Estabelecimento",
            "ledger_category": "Categoria",
            "ledger_notes": "Observações / Tags",
            "ledger_recycle_bin": "Lixeira (30 dias)",

            // Orçamento (Budget)
            "budget_title": "Orçamento e Envelopes",
            "budget_planned": "Planejado",
            "budget_spent": "Gasto",
            "budget_remaining": "Restante",
            "budget_copy_last": "Copiar Mês Anterior (c)",
            "budget_average": "Média Histórica (v)",
            "budget_median": "Mediana (m)",
            "budget_scale": "Escalar (+/-)",

            // Contas Fixas (Bills)
            "bills_title": "Contas Recorrentes",
            "bills_due": "A Vencer",
            "bills_overdue": "Vencidas",
            "bills_auto_post": "Lançamento Automático",

            // Relatórios (Reports)
            "reports_title": "Relatórios e Análises",
            "reports_runway": "Reserva Financeira (Runway)",
            "reports_daily_avg": "Média Diária de Gastos",

            // Configurações
            "settings_title": "Configurações do Sistema",
            "settings_language": "Idioma da Aplicação",
            "settings_base_currency": "Moeda Base (BRL / USD)",
            "settings_rate_source": "Fonte de Cotações de Câmbio",
            "settings_mcp": "Endereço de Agentes MCP"
        }
    })

    // Dicionário de Mapeamento de Categorias e Subcategorias
    readonly property var categoryTranslations: ({
        "EN": {
            // Categorias Principais de Receita
            "Salary": "Salary",
            "Primary Salary": "Primary Salary",
            "Secondary Salary": "Secondary Salary",
            "Bonus": "Bonus",
            "Overtime": "Overtime",

            "Self-Employment": "Self-Employment",
            "Client Invoices": "Client Invoices",
            "Royalties": "Royalties",

            "Benefits": "Benefits",
            "Child Benefit": "Child Benefit",
            "Social Benefits": "Social Benefits",
            "Pension": "Pension",
            "Sick pay": "Sick Pay",

            "Investment Income": "Investment Income",
            "Interest": "Interest",
            "Dividends": "Dividends",
            "Capital gains": "Capital Gains",
            "Rental income": "Rental Income",

            "Other income": "Other Income",
            "Gifts": "Gifts",
            "Refunds & rebates": "Refunds & Rebates",
            "Sale of used goods": "Sale of Used Goods",
            "Tax refund": "Tax Refund",
            "Reimbursements": "Reimbursements",

            // Categorias Principais de Despesa
            "Housing": "Housing",
            "Rent": "Rent",
            "Mortgage payment": "Mortgage Payment",
            "Property tax": "Property Tax (IPTU)",
            "Home insurance": "Home Insurance",
            "Maintenance & repairs": "Maintenance & Repairs",
            "Condo fees": "Condo Fees",

            "Utilities": "Utilities",
            "Electricity": "Electricity",
            "Water & sewage": "Water & Sewage",
            "Gas": "Gas",
            "Internet": "Internet",
            "Mobile phone": "Mobile Phone",
            "Trash collection": "Trash Collection",

            "Food": "Food & Grocery",
            "Groceries": "Groceries",
            "Restaurants & Dining": "Restaurants & Dining",
            "Coffee & Snacks": "Coffee & Snacks",
            "Food delivery": "Food Delivery",

            "Transportation": "Transportation",
            "Fuel": "Fuel",
            "Public transit": "Public Transit",
            "Ride hailing": "Ride Hailing (Uber/99)",
            "Vehicle maintenance": "Vehicle Maintenance",
            "Auto insurance": "Auto Insurance",
            "Parking & tolls": "Parking & Tolls",
            "Vehicle tax": "Vehicle Tax (IPVA)",

            "Healthcare": "Healthcare & Wellness",
            "Health insurance": "Health Insurance",
            "Pharmacy & Medicine": "Pharmacy & Medicine",
            "Doctors & Dentists": "Doctors & Dentists",
            "Gym & Fitness": "Gym & Fitness",
            "Personal care": "Personal Care",

            "Education": "Education",
            "Tuition": "Tuition",
            "Books & Supplies": "Books & Supplies",
            "Courses & Certifications": "Courses & Certifications",

            "Entertainment": "Entertainment & Leisure",
            "Streaming services": "Streaming Services",
            "Movies & Events": "Movies & Events",
            "Hobbies & Games": "Hobbies & Games",
            "Travel & Vacations": "Travel & Vacations",

            "Shopping": "Shopping & Personal",
            "Clothing & Shoes": "Clothing & Shoes",
            "Electronics": "Electronics & Gadgets",
            "Home furnishings": "Home Furnishings",

            "Financial & Taxes": "Financial & Taxes",
            "Bank fees": "Bank Fees",
            "Credit card interest": "Credit Card Interest",
            "Income tax": "Income Tax",
            "Investments": "Investments & Savings"
        },
        "PT-BR": {
            // Categorias Principais de Receita
            "Salary": "Salário e Remuneração",
            "Primary Salary": "Salário Principal",
            "Secondary Salary": "Salário Secundário",
            "Bonus": "Bônus e PLR",
            "Overtime": "Horas Extras",

            "Self-Employment": "Trabalho Autônomo / PJ",
            "Client Invoices": "Faturas de Clientes / Serviços",
            "Royalties": "Direitos Autorais / Royalties",

            "Benefits": "Benefícios e Auxílios",
            "Child Benefit": "Salário-Família / Auxílio-Creche",
            "Social Benefits": "Benefícios Sociais / INSS",
            "Pension": "Aposentadoria / Pensão",
            "Sick pay": "Auxílio-Doença",

            "Investment Income": "Rendimentos de Investimentos",
            "Interest": "Juros de Aplicações",
            "Dividends": "Dividendos e JCP",
            "Capital gains": "Ganho de Capital",
            "Rental income": "Aluguel Recebido",

            "Other income": "Outras Receitas",
            "Gifts": "Presentes e Doações",
            "Refunds & rebates": "Reembolsos e Restituições",
            "Sale of used goods": "Venda de Usados",
            "Tax refund": "Restituição do Imposto de Renda",
            "Reimbursements": "Ressarcimento de Despesas",

            // Categorias Principais de Despesa
            "Housing": "Moradia e Habitação",
            "Rent": "Aluguel",
            "Mortgage payment": "Financiamento Imobiliário",
            "Property tax": "IPTU",
            "Home insurance": "Seguro Residencial",
            "Maintenance & repairs": "Manutenção e Reparos",
            "Condo fees": "Taxa de Condomínio",

            "Utilities": "Serviços Públicos e Contas",
            "Electricity": "Energia Elétrica / Luz",
            "Water & sewage": "Água e Esgoto",
            "Gas": "Gás Encanado / Botijão",
            "Internet": "Internet / Fibra",
            "Mobile phone": "Telefone Celular",
            "Trash collection": "Taxa de Lixo",

            "Food": "Alimentação",
            "Groceries": "Supermercado e Feira",
            "Restaurants & Dining": "Restaurantes e Bares",
            "Coffee & Snacks": "Lanches e Cafés",
            "Food delivery": "Delivery / iFood",

            "Transportation": "Transporte e Veículos",
            "Fuel": "Combustível",
            "Public transit": "Transporte Público / Metrô / Ônibus",
            "Ride hailing": "Aplicativos de Corrida (Uber/99)",
            "Vehicle maintenance": "Manutenção e Oficina",
            "Auto insurance": "Seguro Veicular",
            "Parking & tolls": "Estacionamento e Pedágios",
            "Vehicle tax": "IPVA e Licenciamento",

            "Healthcare": "Saúde e Bem-Estar",
            "Health insurance": "Plano de Saúde",
            "Pharmacy & Medicine": "Farmácia e Medicamentos",
            "Doctors & Dentists": "Consultas e Exames",
            "Gym & Fitness": "Academia e Esportes",
            "Personal care": "Cuidados Pessoais e Salão",

            "Education": "Educação e Desenvolvimento",
            "Tuition": "Mensalidade Escolar / Faculdade",
            "Books & Supplies": "Livros e Material Escolar",
            "Courses & Certifications": "Cursos e Certificações",

            "Entertainment": "Lazer e Entretenimento",
            "Streaming services": "Streaming (Netflix, Spotify)",
            "Movies & Events": "Cinema, Shows e Eventos",
            "Hobbies & Games": "Jogos e Hobbies",
            "Travel & Vacations": "Viagens e Hospedagem",

            "Shopping": "Compras e Pessoal",
            "Clothing & Shoes": "Vestuário e Calçados",
            "Electronics": "Eletrônicos e Gadgets",
            "Home furnishings": "Móveis e Decoração",

            "Financial & Taxes": "Financeiro e Impostos",
            "Bank fees": "Tarifas Bancárias",
            "Credit card interest": "Juros de Cartão",
            "Income tax": "Imposto de Renda",
            "Investments": "Aportes e Investimentos"
        }
    })

    // Função principal de tradução por chave geral
    function tr(key) {
        var dict = translations[currentLanguage] || translations["PT-BR"];
        if (dict && dict[key] !== undefined) {
            return dict[key];
        }
        var fallbackDict = translations["EN"];
        if (fallbackDict && fallbackDict[key] !== undefined) {
            return fallbackDict[key];
        }
        return key;
    }

    // Função dedicada para tradução dinâmica de Categorias e Subcategorias
    function trCategory(categoryName) {
        if (!categoryName) return "";
        
        var dict = categoryTranslations[currentLanguage] || categoryTranslations["PT-BR"];
        if (dict && dict[categoryName] !== undefined) {
            return dict[categoryName];
        }
        
        // Fallback em Inglês se não encontrar no dicionário do idioma ativo
        var fallbackDict = categoryTranslations["EN"];
        if (fallbackDict && fallbackDict[categoryName] !== undefined) {
            return fallbackDict[categoryName];
        }
        
        return categoryName; // Retorna o próprio nome se não houver tradução específica
    }
}

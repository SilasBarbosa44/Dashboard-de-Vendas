# 📊 Dashboard de Vendas - MySQL + Power BI

Projeto de portfólio que simula um pipeline completo de BI: 
Extração de dados com SQL, Tratamento no MySQL e Visualização no Power BI.

## 🛠️ Tecnologias Utilizadas
- **Banco de Dados:** MySQL 8.0
- **Visualização:** Power BI Desktop  
- **Linguagem:** SQL

## 📂 Estrutura do Projeto

Dashboard-Vendas-MySQL-PowerBI/
├── dados/
│   └── dados_fake.sql     # Script com INSERTs de dados fake
├── powerbi/
│   ├── Dashboard_Vendas.pbix  # Arquivo do Power BI
│   └── prints/            # Prints das páginas do dashboard
│       ├── 1_Visao_Geral.png
│       ├── 2_Produto.png
│       ├── 3_Cliente.png
│       └── 4_Estado.png
├── database.sql           # Script para criar tabelas: clientes, produtos, vendas
└── README.md              # Documentação do projeto

## 🚀 Como Rodar o Projeto

### 1. Configurar o Banco de Dados
1. Abra o MySQL Workbench
2. Execute o `database.sql` para criar as 7 tabelas
3. Execute o `dados/dados_fake.sql` para popular o banco

### 2. Abrir o Dashboard no Power BI
1. Abra o arquivo `powerbi/Dashboard_Vendas.pbix`
2. Clique em "Atualizar" para conectar no seu MySQL local

## 📈 Principais Insights do Dashboard
Com base nos dados fake:

| KPI | Valor |
| --- | --- |
| **Faturamento Total** | R$ 23.900,00 |
| **Total de Itens Vendidos** | 13 |
| **Ticket Médio** | R$ 2.390,00 |
| **Top Produto** | Notebook Dell - R$ 14.000,00 |
| **Top Cliente** | Pedro Alves - R$ 10.000,00 |

## 🖼️ Prints do Dashboard

### 1. Visão Geral
![Visão Geral](powerbi/prints/1_Visao_Geral.png)

### 2. Vendas por Produto
![Vendas por Produto](powerbi/prints/2_Produto.png)

### 3. Top Clientes
![Top Clientes](powerbi/prints/3_Cliente.png)

### 4. Vendas por Vendedores
![Vendas por Vendedores](powerbi/prints/4_Vendedores.png)

## 👨‍💻 Autor
Feito por [Silas Barbosa da Silva]

[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)]([https://www.linkedin.com/feed/])
s
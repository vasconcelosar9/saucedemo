# 🧪 Automação de Testes - SauceDemo

Este projeto implementa testes automatizados para o site [SauceDemo](https://www.saucedemo.com), uma plataforma de e-commerce demo usada para práticas de automação de testes. A suite inclui testes para login, lista de produtos, carrinho de compras e checkout.

## 🧩 Tecnologias Utilizadas
- **Robot Framework** (Framework de automação)
- **SeleniumLibrary** (Controle do navegador)
- **FakerLibrary** (Geração de dados fictícios)
- **Python** (Linguagem base)

## ⚙️ Funcionalidades Testadas

### 🔐 Testes de Login
- Login com credenciais válidas
- Tentativas com usuário/senha inválidos
- Campos obrigatórios
- Usuário bloqueado

### 🛍️ Testes de Produtos
- Adição/remoção de produtos no carrinho
- Ordenação de produtos (A-Z, Z-A)
- Ordenação por preço (crescente/decrescente)
- Adição múltipla de produtos

### 🛒 Testes de Carrinho
- Visualização de itens
- Remoção de itens individuais
- Remoção de todos os itens
- Fluxo "Continuar Comprando"
- Navegação para checkout

### 💰 Testes de Checkout
- Finalização com dados válidos
- Validação de campos obrigatórios
- Cancelamento em diferentes etapas
- Fluxo completo de compra

## 🔧 Instalação
```bash
# Clonar repositório
git clone https://github.com/vasconcelosar9/saucedemo.git

# Acessar diretório
cd saucedemo

# Criar ambiente virtual (opcional)
python -m venv .venv

# Ativar ambiente virtual (Windows)
.\.venv\Scripts\activate
```

## ⚙️ Configuração
O arquivo base.resource contém as configurações principais:
- URL do site
- Seletores de elementos
- Configurações do navegador
- Keywords compartilhadas

## ▶️ Executando os Testes
- Execute todos os testes:
```bash
robot tests/
```

### Executar testes específicos:
- Testes de login
```bash
robot tests/login_tests.robot
```

- Testes com tag específica
```bash
robot --include login_sucesso tests/
```

## 🔍 Relatórios
Após a execução, os relatórios estarão disponíveis em:
- log.html: Log detalhado da execução
- report.html: Relatório sumarizado
- output.xml: Dados em formato XML

# 🚀 Flutter GetX: Aplicação de Login Completa

[![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev/)
[![GetX](https://img.shields.io/badge/GetX-8000FF?style=for-the-badge&logo=data:image/svg+xml;base64,PHN2ZyB2aWV3Qm94PSIwIDAgMzYgMzYiIGZpbGw9Im5vbmUiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+PHBhdGggZD0iTTcuMjE5ODggMTIuNTYwMkM0LjExMzU4IDE0LjU2NTQgMi4yOTYxNCAxNy43MDYyIDIuMjk2MTQgMjEuNzY4MVYyMi42Njk3QzIuMjk2MTQgMjcuOTczNCA0Ljc0NDM3IDMyLjY5NDUgMTAuMjY1NCAzMi42OTQ1SDI1Ljc1ODdDMzEuMjgwNCAzMi42OTQ1IDMzLjczMzIgMjcuOTczNCAzMy43MzMyIDIyLjY2OTdWMTYuNTE3QzMzLjczMzIgMTEuMjEzMyAzMS4yODA0IDYuNDkzMjEgMjUuNzU4NyA2LjQ5MzIxSDExLjUxOTNDNS45OTczOSA2LjQ5MzIxIDMuNTc5NjcgMTEuMjEzMyAzLjU3OTY3IDE2LjUxN0g3LjIxODg3QzcuMjE4ODcgMTMuMzcwOSA5LjEwNTQxIDguNzc3NCAxMS41MTk0IDguNzc3NEgyNS43NTg3QzMwLjM3MDQgOC43Nzc0IDMxLjUzODkgMTMuMjQ5NyAzMS41Mzg5IDE2LjUxN1YyMi42Njk3QzMxLjUzODkgMjcuMjgyNiAyOS42NTI0IDMxLjA2NzUgMjUuNzU4NyAzMS4wNjc1SDEwLjI2NTRDNi4zNzE3MyAzMS4wNjc1IDQuNDg1NDUgMjcuMjg0NSA0LjQ4NTQ1IDIyLjY2OTdWMjEuNzY4MUM0LjQ4NTQ1IDE3LjcwNjQgNi4zNzIwNSAxNC41NjU0IDkuMTA1NDEgMTIuNTYwMkMyLjM5MjUgMTIuNTYwMiAxLjA0OTgxIDE1LjE3OTIgMS4wNDk4MSAxNi41MTdWMjIuNzc3MUMxLjA0OTgxIDI4LjA4MDggMy41MTc0NyAzMi42OTQ1IDkuMDM4NjUgMzIuNjk0NUgyNi45ODA5QzMyLjUxMDggMzIuNjk0NSAzNiAzMy40NTU3IDM2IDMyLjIyOTlWMjIuNDAyOEMzNiAxNi43OTk5IDMyLjY4NDIgMTIuNTYwMiAyNi42NzM4IDEyLjU2MDJINy4yMTg4N1oiIGZpbGw9IiNGRkZGRkYiLz48L3N2Zw==&logoColor=white)](https://pub.dev/packages/get)
[![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev/)

Um projeto exemplo em Flutter que demonstra a implementação completa de um fluxo de login/autenticação utilizando os três pilares do framework **GetX**: Gerenciamento de Estado, Rotas e Dependências.

---

### 🌟 Visão Geral e Objetivo

Este repositório serve como um guia prático para desenvolvedores Flutter que desejam adotar o GetX. O foco é na arquitetura limpa, separação de responsabilidades (SoC) e eficiência no controle de estado e navegação.

O fluxo implementado:
1. **Login:** Captura de credenciais.
2. **Carregamento:** Estado reativo de *loading* no botão.
3. **Autenticação:** Lógica de validação no `LoginController`.
4. **Comunicação:** Atualização de um `UserController` global (estado compartilhado).
5. **Navegação:** Redirecionamento seguro para a `HomeScreen` com limpeza da pilha de rotas.

---

### 🛠️ Tecnologias Utilizadas

* **Flutter:** Framework principal.
* **GetX:** Gerenciamento de Estado, Rotas e Dependências.
* **Dart:** Linguagem de programação.

---

### 🧩 Pilares do GetX em Ação

O projeto exemplifica o uso profissional do GetX em seus módulos:

| Módulo | Componente Principal | O Que Demonstra |
| :--- | :--- | :--- |
| **Gerenciamento de Estado** | `.obs` (Rx), `Obx` | Variáveis reativas (`isLoading`, `errorMessage`, `nomeCompleto`) e o *widget* `Obx` para reatividade granular da UI. |
| **Gerenciamento de Rotas** | `GetMaterialApp`, `Get.offAllNamed` | Configuração de rotas nomeadas e navegação do Controller (sem `BuildContext`) para controlar o fluxo de autenticação. |
| **Gerenciamento de Dependências** | `Bindings`, `Get.lazyPut`, `Get.find` | Uso de `Bindings` (`LoginBinding`) para injetar o `LoginController` na rota e uso de `Get.put` no `main.dart` para registrar o `UserController` globalmente. |
| **Arquitetura** | `LoginController`, `UserController` | Separação da lógica de autenticação (`LoginController`) da lógica do estado global do usuário (`UserController`). |

---

### 🚀 Como Rodar o Projeto

1.  **Clone o Repositório:**
    ```bash
    git clone [SEU_LINK_DO_REPOSITORIO]
    cd flutter_getx_login_exemplo
    ```
2.  **Instale as Dependências:**
    ```bash
    flutter pub get
    ```
3.  **Execute o Aplicativo:**
    ```bash
    flutter run
    ```

### 🔑 Credenciais de Teste

Utilize as seguintes credenciais para testar o login bem-sucedido:

| Campo | Valor |
| :--- | :--- |
| **Email** | `user@test.com` |
| **Senha** | `123456` |

Qualquer outra credencial resultará em uma mensagem de erro reativa.

---

### 📂 Estrutura do Projeto (Arquivos Chave)

Abaixo estão os arquivos centrais para entender a arquitetura GetX:
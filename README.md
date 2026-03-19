# Yodapp Robot

Projeto de automação de testes mobile Android com Robot Framework, Appium e AppiumLibrary. Os testes validam fluxos do aplicativo `Yodapp` usando um APK local disponível no repositório.

## Tecnologias

- Robot Framework
- Appium
- AppiumLibrary
- Android Emulator
- UIAutomator2

## Estrutura do projeto

```text
yodapp-robot/
|-- app/
|   `-- yodapp-beta.apk
|-- resources/
|   `-- base.resource
|-- tests/
|   |-- checkbox.robot
|   |-- click.robot
|   |-- home.robot
|   |-- login.robot
|   |-- radio.robot
|   |-- spinner.robot
|   `-- swipe.robot
|-- requirements.txt
`-- package.json
```

## Pré-requisitos

Antes de executar os testes, garanta que o ambiente tenha:

- Node.js instalado
- Python 3 instalado
- Android SDK configurado
- Um emulador Android disponível
- Appium Server rodando localmente

## Dependências do projeto

### Python

Instale as bibliotecas usadas pelo Robot Framework:

```bash
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
```

### Node.js

O projeto usa Appium 2 e o driver `uiautomator2`:

```bash
npm install
npx appium driver install uiautomator2
```

## Configuração atual da automação

Os testes estão configurados em [`resources/base.resource`](/Users/scoder/Developer/robot/yodapp-robot/resources/base.resource) com os seguintes parâmetros:

- Servidor Appium em `http://localhost:4723`
- Plataforma `Android`
- Automação `UIAutomator2`
- Device name `Android Emulator`
- `udid=emulator-5554`
- APK local em [`app/yodapp-beta.apk`](/Users/scoder/Developer/robot/yodapp-robot/app/yodapp-beta.apk)

Se o seu emulador ou dispositivo usar outro `udid`, ajuste esse valor no arquivo de recursos antes de rodar os testes.

## Como executar

### 1. Inicie o emulador Android

Suba o emulador que será usado na execução dos testes.

### 2. Inicie o Appium Server

```bash
npx appium
```

Se quiser validar se o servidor subiu corretamente, ele deve ficar disponível em `http://localhost:4723`.

### 3. Execute os testes

Para rodar toda a suíte:

```bash
robot -d results tests
```

Para rodar um arquivo específico:

```bash
robot -d results tests/login.robot
```

Para rodar apenas testes com a tag `long`:

```bash
robot -d results -i long tests
```

## Casos de teste cobertos

- `home.robot`: valida a tela inicial do app
- `login.robot`: cobre login com credenciais válidas e inválidas
- `click.robot`: testa clique simples e clique longo
- `checkbox.robot`: marca múltiplas tecnologias
- `radio.robot`: seleciona opção de botão de rádio
- `spinner.robot`: valida seleção de níveis no formulário
- `swipe.robot`: executa gesto de swipe e remoção de item

## Recursos compartilhados

O arquivo [`resources/base.resource`](/Users/scoder/Developer/robot/yodapp-robot/resources/base.resource) centraliza keywords reutilizáveis, como:

- abertura da sessão Appium
- navegação inicial no app
- acesso ao menu lateral
- encerramento da sessão

## Resultados da execução

Os relatórios podem ser gerados na pasta `results/` com os artefatos padrão do Robot Framework, como:

- `log.html`
- `report.html`
- `output.xml`

## Observações

- O projeto assume que o APK já está versionado localmente no repositório.
- Os testes foram escritos para Android e não incluem configuração para iOS.
- O arquivo `home.robot` abre a aplicação diretamente, enquanto os demais cenários reutilizam keywords do arquivo base.

## Autor

Victor Boaventura

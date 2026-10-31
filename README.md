# Tarefa 03 — Docker Compose, MariaDB e Administração de SGBD

Este repositório contém os arquivos desenvolvidos para a realização da Tarefa 03 da disciplina DCT2201 — Banco de Dados, do curso de Bacharelado em Sistemas de Informação da Universidade Federal do Rio Grande do Norte (UFRN).

## Organização dos arquivos

Os arquivos estão organizados na seguinte estrutura:

```text
dct2201-banco-de-dados/
├── evidencias-topicos-7ao9/
├── tarefa03/
│   ├── .env.example
│   ├── docker-compose.yml
│   └── tarefa03.md
├── tarefa03-ambiente2/
│   └── docker-compose.yml
├── .gitignore
├── povoamento.sql
├── setup.sql
└── README.md
```

Os arquivos `.env` e `setup.local.sql` são utilizados localmente e não devem ser enviados ao GitHub.

## Descrição dos arquivos

| Arquivo | Finalidade |
|---|---|
| `docker-compose.yml` | Define os serviços MariaDB e CloudBeaver. |
| `.env.example` | Apresenta as variáveis necessárias para configurar o ambiente, sem expor credenciais reais. |
| `tarefa03.md` | Contém o relatório, as respostas e os desafios da atividade. |
| `tarefa03-ambiente2/` | Contém a configuração do segundo ambiente Docker, utilizado nos testes de isolamento. |
| `.gitignore` | Impede o versionamento de arquivos sensíveis, como `.env` e `setup.local.sql`. |
| `povoamento.sql` | Contém comandos SQL para inserir autores e livros no banco de dados. |
| `setup.sql` | Automatiza a criação do banco `biblioteca`, suas tabelas, usuários, privilégios e dados iniciais. |
| `evidencias-topicos-7ao9/` | Armazena capturas de tela utilizadas como evidências da execução das atividades. |

## Ambientes Docker

Foram configurados dois ambientes independentes utilizando Docker Compose, com instâncias MariaDB e CloudBeaver.

- **Primeiro ambiente:** MariaDB na porta `3307` e CloudBeaver na porta `8978`.
- **Segundo ambiente:** MariaDB na porta `3308` e CloudBeaver na porta `8979`.

A separação permite executar e testar ambientes diferentes sem conflitos de portas e volumes.

## Segurança das credenciais

As credenciais reais são armazenadas em arquivos `.env`, mantidos apenas localmente. O arquivo `.env.example` disponibiliza as configurações necessárias sem expor senhas.

O arquivo `setup.local.sql` também é mantido localmente para armazenar credenciais de uso real, enquanto `setup.sql` utiliza senhas fictícias de exemplo.

Esses arquivos estão protegidos pelo `.gitignore` e não devem ser versionados.

## Repositório da disciplina

Este repositório pessoal contém exclusivamente os arquivos de infraestrutura, configuração e evidências da Tarefa 03.

As respostas da atividade são entregues separadamente no repositório `bsi-tasks`, conforme as orientações da disciplina.
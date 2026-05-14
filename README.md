# GEA — Gestão de Eventos Acadêmicos

Banco de dados relacional desenvolvido para gerenciar eventos acadêmicos, incluindo controle de participantes, palestrantes, inscrições e presença.

---

## Sobre o Projeto

O **GEA** é um projeto acadêmico de modelagem e implementação de banco de dados relacional utilizando **MySQL**. O sistema foi projetado para atender as necessidades de instituições de ensino na organização de eventos como palestras, workshops, seminários, minicursos e mesas redondas.
Esse projeto foi desenvolvido por:
[Kauan Wendel](https://github.com/kauwendel)\
[Rayan Lima](https://github.com/rclima522-bit)\
[Ayran Boudoux](https://github.com/ayranboudoux)

---

## Estrutura do Repositório

```
bd-gestao-eventos-academicos/
│
├── scripts/
│   ├── 01_create.sql      # Criação do banco de dados e tabelas
│   ├── 02_inserts.sql     # Inserção de dados para testes
│   └── 03_queries.sql     # Consultas SQL desenvolvidas
│
├── docs/
│   └── diagramas       # Diagramas conceitual e lógico
│
└── README.md
```

---

## Modelo de Dados

O banco é composto por **7 tabelas**:

| Tabela               | Descrição                                              |
|----------------------|--------------------------------------------------------|
| `participantes`      | Pessoas inscritas nos eventos                          |
| `tipo_evento`        | Categorias de eventos (palestra, workshop etc.)        |
| `evento`             | Dados dos eventos realizados                           |
| `palestrante`        | Profissionais que ministram os eventos                 |
| `evento_palestrante` | Associação N:N entre eventos e palestrantes            |
| `inscricao`          | Registro de inscrições dos participantes               |
| `presenca`           | Controle de presença e percentual de participação      |

Para visualizar os diagramas conceitual e lógico, acesse [`docs`](docs).

---

## Como Executar

### Pré-requisitos

- MySQL 8.0 ou superior
- Cliente MySQL (MySQL Workbench, DBeaver, terminal etc.)

### Passo a passo

1. Clone o repositório:
   ```bash
   git clone https://github.com/seu-usuario/bd-gestao-eventos-academicos.git
   cd bd-gestao-eventos-academicos
   ```

2. Execute os scripts na ordem:
   ```bash
   mysql -u root -p < scripts/01_create.sql
   mysql -u root -p GEA < scripts/02_inserts.sql
   mysql -u root -p GEA < scripts/03_queries.sql
   ```

   Ou abra cada arquivo manualmente no seu cliente MySQL e execute na sequência **01 → 02 → 03**.

---

## Consultas Disponíveis

O arquivo `03_queries.sql` contém as seguintes consultas:

| # | Consulta |
|---|----------|
| 01 | Listar todos os participantes cadastrados |
| 02 | Listar eventos futuros |
| 03 | Participantes inscritos em determinado evento |
| 04 | Quantidade de inscritos por evento |
| 05 | Eventos com vagas disponíveis |
| 06 | Participantes com presença acima de 75% |
| 07 | Palestrantes e os eventos em que participam |

---

## Dados de Exemplo

Os scripts de inserção incluem:

- 10 participantes
- 5 tipos de evento
- 5 eventos
- 5 palestrantes
- 15 inscrições (com status: confirmada, pendente e cancelada)
- 5 registros de presença

---

## Tecnologias Utilizadas

- **MySQL 8.0**
- **SQL** (DDL e DML)

---

## Informações Acadêmicas

> Projeto desenvolvido como atividade prática da disciplina de **Banco de Dados**.

---

## Licença

Este projeto é de uso acadêmico e está disponível para fins educacionais.

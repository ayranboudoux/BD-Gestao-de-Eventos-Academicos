-- ============================================================
-- GEA - Gestão de Eventos Acadêmicos
-- Script 01: Criação do Banco de Dados e Tabelas
-- ============================================================

create database if not exists GEA;
use GEA;

-- Tabela de participantes
create table participantes(
    id_participante int auto_increment not null primary key,
    nome            varchar(120) not null,
    cpf             char(11) not null unique,
    email           varchar(120) not null unique,
    telefone        varchar(20),
    curso           varchar(80),
    data_nascimento date
);

-- Tabela Tipo do Evento
create table tipo_evento(
    id_tipo   int auto_increment not null primary key,
    descricao varchar(60) not null unique
);

-- Tabela de Eventos
create table evento(
    id_evento     int auto_increment not null primary key,
    id_tipo       int not null references tipo_evento(id_tipo),
    nome          varchar(120) not null,
    descricao     text,
    data          date not null,
    horario       time not null,
    carga_horaria int not null,
    vagas_max     int not null,
    local         varchar(120) not null
);

-- Tabela Palestrante
create table palestrante(
    id_palestrante      int auto_increment not null primary key,
    nome                varchar(120) not null,
    formacao            varchar(120),
    empresa_instituicao varchar(120),
    email               varchar(120) not null unique,
    telefone            varchar(20),
    mini_curriculo      text
);

-- Tabela Evento_Palestrante (N:N)
create table evento_palestrante(
    id_evento      int not null references evento(id_evento),
    id_palestrante int not null references palestrante(id_palestrante),
    primary key (id_evento, id_palestrante)
);

-- Tabela Inscrição
create table inscricao(
    id_inscricao    int not null auto_increment primary key,
    id_participante int not null references participantes(id_participante),
    id_evento       int not null references evento(id_evento),
    data_inscricao  date not null,
    status          enum('pendente','confirmada','cancelada') not null default 'pendente',
    unique(id_participante, id_evento)
);

-- Tabela Presença
create table presenca(
    id_presenca         int not null auto_increment primary key,
    id_participante     int not null references participantes(id_participante),
    id_evento           int not null references evento(id_evento),
    data_presenca       date not null,
    percentual_presenca decimal(5,2),
    unique(id_participante, id_evento)
);

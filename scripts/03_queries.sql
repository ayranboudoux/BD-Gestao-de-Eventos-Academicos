-- ============================================================
-- GEA - Gestão de Eventos Acadêmicos
-- Script 03: Consultas (SELECTs)
-- ============================================================

use GEA;

-- ------------------------------------------------------------
-- 01. listar todos os participantes cadastrados
-- ------------------------------------------------------------
select
    id_participante,
    nome,
    cpf,
    email,
    telefone,
    curso
from participantes
order by nome;


-- ------------------------------------------------------------
-- 02. listar eventos futuros
-- ------------------------------------------------------------
select
    e.id_evento,
    e.nome,
    te.descricao                    as tipo,
    date_format(e.data, '%d/%m/%Y') as data,
    e.horario,
    e.carga_horaria,
    e.vagas_max,
    e.local
from evento e
join tipo_evento te on e.id_tipo = te.id_tipo
where e.data > curdate()
order by e.data;


-- ------------------------------------------------------------
-- 03. participantes inscritos em determinado evento
--     (substitua o valor '1' pelo id_evento desejado)
-- ------------------------------------------------------------
select
    p.id_participante,
    p.nome,
    p.email,
    p.curso,
    i.status
from inscricao i
join participantes p on i.id_participante = p.id_participante
where i.id_evento = 1
order by p.nome;


-- ------------------------------------------------------------
-- 04. quantidade de inscritos por evento
-- ------------------------------------------------------------
select
    e.id_evento,
    e.nome                          as evento,
    count(i.id_inscricao)           as total_inscritos
from evento e
left join inscricao i on e.id_evento = i.id_evento
group by e.id_evento, e.nome
order by total_inscritos desc;


-- ------------------------------------------------------------
-- 05. eventos com vagas disponíveis
-- ------------------------------------------------------------
select
    e.id_evento,
    e.nome                                              as evento,
    date_format(e.data, '%d/%m/%Y')                     as data,
    e.vagas_max,
    count(i.id_inscricao)                               as inscritos,
    (e.vagas_max - count(i.id_inscricao))               as vagas_disponiveis
from evento e
left join inscricao i on e.id_evento = i.id_evento
    and i.status != 'cancelada'
group by e.id_evento, e.nome, e.data, e.vagas_max
having vagas_disponiveis > 0
order by vagas_disponiveis desc;


-- ------------------------------------------------------------
-- 06. participantes com presença acima de 75%
-- ------------------------------------------------------------
select
    p.id_participante,
    p.nome,
    p.email,
    e.nome                          as evento,
    pr.percentual_presenca
from presenca pr
join participantes p on pr.id_participante = p.id_participante
join evento e on pr.id_evento = e.id_evento
where pr.percentual_presenca > 75
order by pr.percentual_presenca desc;


-- ------------------------------------------------------------
-- 07. palestrantes e os eventos em que participam
-- ------------------------------------------------------------
select
    pa.id_palestrante,
    pa.nome                         as palestrante,
    pa.formacao,
    pa.empresa_instituicao,
    e.nome                          as evento,
    date_format(e.data, '%d/%m/%Y') as data
from palestrante pa
join evento_palestrante ep on pa.id_palestrante = ep.id_palestrante
join evento e on ep.id_evento = e.id_evento
order by pa.nome, e.data;

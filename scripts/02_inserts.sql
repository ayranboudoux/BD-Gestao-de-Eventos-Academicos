-- ============================================================
-- GEA - Gestão de Eventos Acadêmicos
-- Script 02: Inserção de Dados (INSERTs)
-- ============================================================

use GEA;

-- 1. Tipos de Evento
INSERT INTO tipo_evento (descricao) VALUES
('Palestra'),
('Workshop'),
('Seminário'),
('Minicurso'),
('Mesa Redonda');

-- 2. Participantes
INSERT INTO participantes (nome, cpf, email, telefone, curso, data_nascimento) VALUES
('Ana Beatriz Souza',       '12345678901', 'ana.beatriz@email.com',    '71991110001', 'Sistemas de Informação',  '2001-03-15'),
('Carlos Eduardo Lima',     '23456789012', 'carlos.lima@email.com',    '71991110002', 'Engenharia de Software',  '2000-07-22'),
('Fernanda Oliveira',       '34567890123', 'fernanda.oli@email.com',   '71991110003', 'Ciência da Computação',   '2002-01-10'),
('Rafael Mendes Costa',     '45678901234', 'rafael.mendes@email.com',  '71991110004', 'Análise e Desenvolvimento','1999-11-30'),
('Juliana Pereira Santos',  '56789012345', 'juliana.ps@email.com',     '71991110005', 'Engenharia de Software',  '2001-05-18'),
('Lucas Alves Ferreira',    '67890123456', 'lucas.alves@email.com',    '71991110006', 'Sistemas de Informação',  '2003-09-04'),
('Mariana Castro Rocha',    '78901234567', 'mariana.cr@email.com',     '71991110007', 'Ciência da Computação',   '2000-02-27'),
('Thiago Nunes Barbosa',    '89012345678', 'thiago.nb@email.com',      '71991110008', 'Redes de Computadores',   '2002-08-13'),
('Isabela Ramos Duarte',    '90123456789', 'isabela.rd@email.com',     '71991110009', 'Banco de Dados',          '2001-12-01'),
('Pedro Henrique Gomes',    '01234567890', 'pedro.hg@email.com',       '71991110010', 'Análise e Desenvolvimento','2000-06-09');

-- 3. Palestrantes
INSERT INTO palestrante (nome, formacao, empresa_instituicao, email, telefone, mini_curriculo) VALUES
('Dr. Roberto Andrade',    'Doutorado em Inteligência Artificial', 'UFBA',                'roberto.andrade@ufba.br',    '71988880001', 'Professor pesquisador com 15 anos de experiência em IA e Machine Learning.'),
('Profa. Carla Monteiro',  'Mestrado em Segurança da Informação',  'Instituto Federal BA', 'carla.monteiro@ifba.edu.br', '71988880002', 'Especialista em cibersegurança e desenvolvimento seguro de sistemas.'),
('Eng. Marcos Teixeira',   'Graduação em Engenharia de Software',  'TechSolutions Ltda',   'marcos.teixeira@tech.com',   '71988880003', 'Desenvolvedor sênior com foco em arquitetura de microsserviços e DevOps.'),
('Ma. Patrícia Vieira',    'Mestrado em Banco de Dados',           'DataBrasil S.A.',      'patricia.vieira@data.com',   '71988880004', 'Arquiteta de dados com experiência em soluções de Big Data e cloud computing.'),
('Dr. Felipe Nascimento',  'Doutorado em Redes de Computadores',   'UEFS',                 'felipe.nasc@uefs.br',        '71988880005', 'Pesquisador de redes neurais e infraestrutura de telecomunicações avançadas.');

-- 4. Eventos
INSERT INTO evento (id_tipo, nome, descricao, data, horario, carga_horaria, vagas_max, local) VALUES
(1, 'IA na Prática: Do Conceito à Aplicação',         'Palestra sobre aplicações reais de Inteligência Artificial no mercado.',                '2026-08-10', '09:00:00', 2, 80, 'Auditório Principal – Bloco A'),
(2, 'Workshop de Segurança Web',                       'Mão na massa com ferramentas de análise de vulnerabilidades e boas práticas OWASP.',   '2026-08-17', '14:00:00', 4, 30, 'Laboratório de Informática 2 – Bloco B'),
(3, 'Seminário de Arquitetura de Software',            'Discussão sobre padrões modernos: microsserviços, serverless e event-driven.',          '2026-08-24', '10:00:00', 3, 60, 'Sala de Conferências – Bloco C'),
(4, 'Minicurso de SQL Avançado e Modelagem de Dados',  'Técnicas avançadas de consultas, otimização e modelagem relacional.',                  '2026-09-07', '08:00:00', 8, 25, 'Laboratório de Informática 1 – Bloco B'),
(5, 'Mesa Redonda: Futuro das Redes 5G e 6G',          'Debate com especialistas sobre tendências em telecomunicações e impactos sociais.',    '2026-09-14', '16:00:00', 2, 50, 'Auditório Principal – Bloco A');

-- 5. Evento_Palestrante (associações)
INSERT INTO evento_palestrante (id_evento, id_palestrante) VALUES
(1, 1), -- IA na Prática → Dr. Roberto Andrade
(2, 2), -- Workshop Segurança → Profa. Carla Monteiro
(3, 3), -- Seminário Arquitetura → Eng. Marcos Teixeira
(4, 4), -- Minicurso SQL → Ma. Patrícia Vieira
(5, 5), -- Mesa Redonda Redes → Dr. Felipe Nascimento
(1, 3), -- IA na Prática → Eng. Marcos Teixeira (palestrante convidado)
(5, 1); -- Mesa Redonda → Dr. Roberto Andrade (participação especial)

-- 6. Inscrições
INSERT INTO inscricao (id_participante, id_evento, data_inscricao, status) VALUES
-- Evento 1: IA na Prática
(1, 1, '2025-07-20', 'confirmada'),
(2, 1, '2025-07-21', 'confirmada'),
(3, 1, '2025-07-22', 'confirmada'),
(4, 1, '2025-07-23', 'pendente'),
-- Evento 2: Workshop Segurança
(5, 2, '2025-07-25', 'confirmada'),
(6, 2, '2025-07-26', 'confirmada'),
(7, 2, '2025-07-27', 'cancelada'),
-- Evento 3: Seminário Arquitetura
(8, 3, '2025-08-01', 'confirmada'),
(9, 3, '2025-08-02', 'confirmada'),
(1, 3, '2025-08-03', 'pendente'),
-- Evento 4: Minicurso SQL
(10, 4, '2025-08-10', 'confirmada'),
(2,  4, '2025-08-11', 'confirmada'),
-- Evento 5: Mesa Redonda Redes
(3, 5, '2025-08-15', 'confirmada'),
(5, 5, '2025-08-16', 'confirmada'),
(8, 5, '2025-08-17', 'pendente');

-- 7. Presenças
INSERT INTO presenca (id_participante, id_evento, data_presenca, percentual_presenca) VALUES
(1, 1, '2025-08-10', 100.00),
(2, 1, '2025-08-10', 100.00),
(3, 1, '2025-08-10',  75.00),
(5, 2, '2025-08-17', 100.00),
(6, 2, '2025-08-17',  50.00);


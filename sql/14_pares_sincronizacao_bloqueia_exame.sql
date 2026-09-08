-- ProdClin — v6.43.1 — Caso especial "Biópsia": Atendimento indica
-- biópsia → Exame fica bloqueado/vazio (não é um par de valor fixo como
-- Preparo↔Preparo Colonoscopia; é uma regra de bloqueio). Fica na mesma
-- tabela de pares (v6.43.0), com uma coluna nova pra marcar esse caso —
-- valor_exame fica null quando bloqueia_exame = true.

alter table pares_sincronizacao_lancamento add column if not exists bloqueia_exame boolean not null default false;
alter table pares_sincronizacao_lancamento alter column valor_exame drop not null;

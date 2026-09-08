-- ProdClin — v6.43.0 — Sincronização Atendimento ↔ Exame, configurável
-- pelo usuário (Configurações → Cadastros do Sistema). Quando o valor
-- escolhido em "Atendimento" (procedimento) OU "Exame" bate com um par
-- cadastrado aqui, o outro campo sincroniza automaticamente. Ex.: par
-- (BIÓPSIA, BIÓPSIA), ou (PREPARO, PREPARO COLONOSCOPIA).

create table if not exists pares_sincronizacao_lancamento (
  id uuid primary key default gen_random_uuid(),
  valor_atendimento text not null,
  valor_exame text not null,
  criado_em timestamptz not null default now()
);
alter table pares_sincronizacao_lancamento enable row level security;
create policy acesso_total_anon on pares_sincronizacao_lancamento for all using (true) with check (true);

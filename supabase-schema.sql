-- Run this once in Supabase Dashboard → SQL Editor.
-- This table stores one private QS Pro workspace per authenticated account.
create table if not exists public.qspro_workspaces (
  user_id uuid primary key references auth.users(id) on delete cascade,
  workspace jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);

alter table public.qspro_workspaces enable row level security;

drop policy if exists "Users can read their QS Pro workspace" on public.qspro_workspaces;
create policy "Users can read their QS Pro workspace"
  on public.qspro_workspaces for select to authenticated
  using (auth.uid() = user_id);

drop policy if exists "Users can create their QS Pro workspace" on public.qspro_workspaces;
create policy "Users can create their QS Pro workspace"
  on public.qspro_workspaces for insert to authenticated
  with check (auth.uid() = user_id);

drop policy if exists "Users can update their QS Pro workspace" on public.qspro_workspaces;
create policy "Users can update their QS Pro workspace"
  on public.qspro_workspaces for update to authenticated
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);

revoke all on public.qspro_workspaces from anon;
grant select, insert, update on public.qspro_workspaces to authenticated;

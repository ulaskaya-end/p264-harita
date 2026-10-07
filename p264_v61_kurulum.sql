-- v6.1: mühendis atamaları ve yönetici şifresi için ayarlar tablosu
create table if not exists ayarlar (key text primary key, value jsonb, updated_at timestamptz default now());
alter table ayarlar enable row level security;
drop policy if exists "ayar herkes okur" on ayarlar;
drop policy if exists "ayar herkes yazar" on ayarlar;
drop policy if exists "ayar herkes gunceller" on ayarlar;
create policy "ayar herkes okur" on ayarlar for select using (true);
create policy "ayar herkes yazar" on ayarlar for insert to anon, authenticated with check (true);
create policy "ayar herkes gunceller" on ayarlar for update to anon, authenticated using (true) with check (true);

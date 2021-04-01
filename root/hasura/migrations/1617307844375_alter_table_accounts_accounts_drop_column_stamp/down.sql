alter table "accounts"."accounts" alter column "stamp" set default now();
alter table "accounts"."accounts" alter column "stamp" drop not null;
alter table "accounts"."accounts" add column "stamp" timestamptz;

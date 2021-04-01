alter table "accounts"."accounts" add column "created_at" timestamptz
 null default now();

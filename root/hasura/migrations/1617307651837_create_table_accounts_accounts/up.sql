CREATE TABLE "accounts"."accounts" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "name" varchar NOT NULL, "details" text, "properties" json NOT NULL DEFAULT json_build_object(), "stamp" timestamptz NOT NULL DEFAULT now(), PRIMARY KEY ("id") , UNIQUE ("id"));
CREATE EXTENSION IF NOT EXISTS pgcrypto;

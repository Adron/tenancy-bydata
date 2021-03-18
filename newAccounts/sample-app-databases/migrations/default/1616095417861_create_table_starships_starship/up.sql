CREATE TABLE "starships"."starship" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "name" text NOT NULL, "launch" date, "stamp" timestamptz NOT NULL DEFAULT now(), "details" text, PRIMARY KEY ("id") , UNIQUE ("id"));
CREATE EXTENSION IF NOT EXISTS pgcrypto;

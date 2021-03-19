CREATE TABLE "ecommerce"."user" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "stamp" timestamptz NOT NULL DEFAULT now(), "name" text NOT NULL, "details" text NOT NULL, "signup_date" timestamptz NOT NULL, PRIMARY KEY ("id") , UNIQUE ("id"));
CREATE EXTENSION IF NOT EXISTS pgcrypto;

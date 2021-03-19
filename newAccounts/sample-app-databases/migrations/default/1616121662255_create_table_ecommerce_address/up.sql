CREATE TABLE "ecommerce"."address" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "name" text NOT NULL, "stamp" timestamptz NOT NULL DEFAULT now(), "street" text NOT NULL, "state" text NOT NULL, "zip" text NOT NULL, PRIMARY KEY ("id") , UNIQUE ("id"));
CREATE EXTENSION IF NOT EXISTS pgcrypto;

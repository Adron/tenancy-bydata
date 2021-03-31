CREATE TABLE "ecommerce"."item" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "stamp" timestamptz NOT NULL DEFAULT now(), "name" text NOT NULL, "available" boolean NOT NULL DEFAULT true, "on_market" timestamptz, "off_market" timestamptz, "cost" numeric, "msrp" numeric, PRIMARY KEY ("id") , UNIQUE ("id"));
CREATE EXTENSION IF NOT EXISTS pgcrypto;

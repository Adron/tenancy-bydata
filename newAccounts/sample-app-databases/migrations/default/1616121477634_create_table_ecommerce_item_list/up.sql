CREATE TABLE "ecommerce"."item_list" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "item_id" uuid NOT NULL, "stamp" timestamptz NOT NULL DEFAULT now(), "details" text NOT NULL, PRIMARY KEY ("id") , FOREIGN KEY ("item_id") REFERENCES "ecommerce"."item"("id") ON UPDATE restrict ON DELETE restrict, UNIQUE ("id"));
CREATE EXTENSION IF NOT EXISTS pgcrypto;

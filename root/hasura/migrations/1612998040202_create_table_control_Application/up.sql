CREATE EXTENSION IF NOT EXISTS pgcrypto;
CREATE TABLE "control"."Application"("Id" uuid NOT NULL DEFAULT gen_random_uuid(), "Stamp" timestamptz NOT NULL DEFAULT now(), "Created" timestamptz NOT NULL, "Name" text NOT NULL, "Description" text NOT NULL, PRIMARY KEY ("Id") , UNIQUE ("Id"));

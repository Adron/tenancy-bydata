CREATE EXTENSION IF NOT EXISTS pgcrypto;
CREATE TABLE "control"."Account"("Id" uuid NOT NULL DEFAULT gen_random_uuid(), "Stamp" timestamptz NOT NULL DEFAULT now(), "Created" timestamptz NOT NULL, "Name" text NOT NULL, "ApplicationId" uuid NOT NULL, PRIMARY KEY ("Id") , UNIQUE ("Id"));

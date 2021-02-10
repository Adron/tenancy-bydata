CREATE EXTENSION IF NOT EXISTS pgcrypto;
CREATE TABLE "control"."User"("Id" uuid NOT NULL DEFAULT gen_random_uuid(), "Stamp" timestamptz NOT NULL DEFAULT now(), "Created" timestamptz NOT NULL, "Name" text NOT NULL, "Email" text NOT NULL, "Details" text, PRIMARY KEY ("Id") , UNIQUE ("Id"), UNIQUE ("Email"));

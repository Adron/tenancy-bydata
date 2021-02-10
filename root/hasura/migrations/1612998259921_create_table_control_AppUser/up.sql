CREATE EXTENSION IF NOT EXISTS pgcrypto;
CREATE TABLE "control"."AppUser"("Id" uuid NOT NULL DEFAULT gen_random_uuid(), "Stamp" timestamptz NOT NULL DEFAULT now(), "Create" timestamptz NOT NULL, "Name" text NOT NULL, "Email" text NOT NULL, "Details" Text NOT NULL, PRIMARY KEY ("Id") , UNIQUE ("Id"));

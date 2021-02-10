CREATE EXTENSION IF NOT EXISTS pgcrypto;
CREATE TABLE "control"."Role"("Id" uuid NOT NULL DEFAULT gen_random_uuid(), "Stamp" timestamptz NOT NULL DEFAULT now(), "Created" timestamptz NOT NULL, "Name" text NOT NULL, "Permissions" json NOT NULL DEFAULT json_build_object(), PRIMARY KEY ("Id") , UNIQUE ("Id"), UNIQUE ("Name"));

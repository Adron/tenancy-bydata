CREATE TABLE "starships"."cruise" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "name" Text NOT NULL, "stamp" timestamptz NOT NULL DEFAULT now(), "waypoints" jsonb NOT NULL DEFAULT jsonb_build_array(), PRIMARY KEY ("id") , UNIQUE ("id"), UNIQUE ("name"));
CREATE EXTENSION IF NOT EXISTS pgcrypto;

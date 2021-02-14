CREATE TABLE "control"."UserRole"("UserId" uuid NOT NULL, "RoleId" uuid NOT NULL, "Stamp" timestamptz NOT NULL DEFAULT now(), "Created" timestamptz NOT NULL, "Details" text NOT NULL, PRIMARY KEY ("UserId","RoleId") );
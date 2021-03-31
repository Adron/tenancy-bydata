CREATE TABLE "ecommerce"."email" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "stamp" timestamptz NOT NULL DEFAULT now(), "user_id" uuid NOT NULL, "email" text NOT NULL, PRIMARY KEY ("id") , FOREIGN KEY ("user_id") REFERENCES "ecommerce"."user"("id") ON UPDATE restrict ON DELETE restrict, UNIQUE ("id"));
CREATE EXTENSION IF NOT EXISTS pgcrypto;

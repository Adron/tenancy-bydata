CREATE TABLE "ecommerce"."shipped" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "user_id" uuid NOT NULL, "order_id" uuid NOT NULL, "address_id" uuid NOT NULL, "stamp" timestamptz NOT NULL DEFAULT now(), "final_shipping" numeric NOT NULL, "final_total" numeric NOT NULL, PRIMARY KEY ("id") , FOREIGN KEY ("user_id") REFERENCES "ecommerce"."user"("id") ON UPDATE restrict ON DELETE restrict, FOREIGN KEY ("order_id") REFERENCES "ecommerce"."order"("id") ON UPDATE restrict ON DELETE restrict, FOREIGN KEY ("address_id") REFERENCES "ecommerce"."address"("id") ON UPDATE restrict ON DELETE restrict, UNIQUE ("id"));
CREATE EXTENSION IF NOT EXISTS pgcrypto;

CREATE TABLE "accounts"."applications" ("name" varchar NOT NULL, "account_id" uuid NOT NULL, "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), PRIMARY KEY ("name","account_id") , FOREIGN KEY ("name") REFERENCES "control"."applications"("name") ON UPDATE restrict ON DELETE restrict, FOREIGN KEY ("account_id") REFERENCES "accounts"."accounts"("id") ON UPDATE restrict ON DELETE restrict);COMMENT ON TABLE "accounts".applications IS E'Active applications for accounts.';
CREATE OR REPLACE FUNCTION "accounts"."set_current_timestamp_updated_at"()
RETURNS TRIGGER AS $$
DECLARE
  _new record;
BEGIN
  _new := NEW;
  _new."updated_at" = NOW();
  RETURN _new;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER "set_accounts_applications_updated_at"
BEFORE UPDATE ON "accounts"."applications"
FOR EACH ROW
EXECUTE PROCEDURE "accounts"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_accounts_applications_updated_at" ON "accounts"."applications" 
IS 'trigger to set value of column "updated_at" to current timestamp on row update';

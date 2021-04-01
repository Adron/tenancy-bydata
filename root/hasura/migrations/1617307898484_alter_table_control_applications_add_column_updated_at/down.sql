-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "control"."applications" add column "updated_at" timestamptz
 null default now();

CREATE OR REPLACE FUNCTION "control"."set_current_timestamp_updated_at"()
RETURNS TRIGGER AS $$
DECLARE
  _new record;
BEGIN
  _new := NEW;
  _new."updated_at" = NOW();
  RETURN _new;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER "set_control_applications_updated_at"
BEFORE UPDATE ON "control"."applications"
FOR EACH ROW
EXECUTE PROCEDURE "control"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_control_applications_updated_at" ON "control"."applications" 
IS 'trigger to set value of column "updated_at" to current timestamp on row update';

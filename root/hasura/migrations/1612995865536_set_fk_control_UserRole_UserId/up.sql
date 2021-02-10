alter table "control"."UserRole"
           add constraint "UserRole_UserId_fkey"
           foreign key ("UserId")
           references "control"."User"
           ("Id") on update restrict on delete restrict;

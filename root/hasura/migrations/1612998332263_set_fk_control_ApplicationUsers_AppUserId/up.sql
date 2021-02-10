alter table "control"."ApplicationUsers"
           add constraint "ApplicationUsers_AppUserId_fkey"
           foreign key ("AppUserId")
           references "control"."AppUser"
           ("Id") on update restrict on delete restrict;

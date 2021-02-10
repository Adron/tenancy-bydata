alter table "control"."ApplicationUsers"
           add constraint "ApplicationUsers_ApplicationId_fkey"
           foreign key ("ApplicationId")
           references "control"."Application"
           ("Id") on update restrict on delete restrict;

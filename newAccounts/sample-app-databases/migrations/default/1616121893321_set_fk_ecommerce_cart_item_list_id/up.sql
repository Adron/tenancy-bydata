alter table "ecommerce"."cart"
  add constraint "cart_item_list_id_fkey"
  foreign key ("item_list_id")
  references "ecommerce"."item_list"
  ("id") on update restrict on delete restrict;

insert into accounts.accounts (name, details, properties)
VALUES ('Coders United', 'Union of Coders', '{"empty":"nothing"}');
insert into accounts.accounts (name, details, properties)
VALUES ('7331 c0d3rz', '', '{}');
insert into accounts.accounts (name, details, properties)
VALUES ('Default Account', 'This is a mock account', '{"firstProperty":"The value for this property"}');

-- Insert the related values into the applications in the accounts schema.
insert into accounts.applications (name, account_id)
values ('Simply To Do', (select id from accounts.accounts where name = 'Coders United'));
insert into accounts.applications (name, account_id)
values ('Easy Meet', (select id from accounts.accounts where name = 'Coders United'));

insert into accounts.applications (name, account_id)
values ('Simply To Do', (select id from accounts.accounts where name = '7331 c0d3rz'));

insert into accounts.applications (name, account_id)
values ('Easy Meet', (select id from accounts.accounts where name = 'Default Account'));
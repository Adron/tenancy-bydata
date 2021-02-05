# Tenancy Example By Data

What's this?

This repository is an example of setting up multiple tenancy using a particular means, in this case, by data stored in a database. It is merely one example of what path one could use to setup tenancy within an application offering.

## Architecture

### Architecture - Root System

### Architecture - New Account Systems

![Process for New Accounts](images/process-new-accounts.png)

<div style="width: 640px; height: 480px; margin: 10px; position: relative;"><iframe allowfullscreen frameborder="0" style="width:640px; height:480px" src="https://lucid.app/documents/embeddedchart/8d23be7c-fc54-453c-85eb-c32afa7e46a1" id="YP..3EygUxrF"></iframe></div>

## Development Setup

**NOTE:** During dev I'm using the env vars in IntelliJ IDEA. Of course, store your envs anywhere you want for dev, this is just a suggestion/reminder to myself.

Set the following environment variables for root:

* DBUN = Database Username
* DBPW = Database Password

Set these parameters/variables for every new account setup:

* server = The server database for the new account

* r 'server='$server'' \
  -var 'username='$username'' \
  -var 'password='$password'' \
  -var 'database='$database'' \
  
## Reference Material

* [Postgres Limits](https://www.postgresql.org/docs/current/limits.html)
* [SQL Server Limits](https://docs.microsoft.com/en-us/sql/sql-server/maximum-capacity-specifications-for-sql-server?redirectedfrom=MSDN&view=sql-server-ver15)
* [Azure Database for PostgreSQL Limits (Single Server)](https://docs.microsoft.com/en-us/azure/postgresql/concepts-limits)
* [Azure Database for PostgreSQL Limits (Flexible Server)](https://docs.microsoft.com/en-us/azure/postgresql/flexible-server/concepts-limits)

provider "azurerm" {
    features {}
}

resource "azurerm_resource_group" "controlrg" {
  name     = "control-rg"
  location = "westus2"
}

resource "azurerm_postgresql_server" "unionstation" {
  name                = var.server
  location            = azurerm_resource_group.controlrg.location
  resource_group_name = azurerm_resource_group.controlrg.name
  sku_name            = "B_Gen5_2"

  storage_mb                   = 5120
  backup_retention_days        = 7
  geo_redundant_backup_enabled = false
  auto_grow_enabled            = true

  administrator_login          = var.username
  administrator_login_password = var.password
  version                      = "11"
  ssl_enforcement_enabled      = true
}

resource "azurerm_postgresql_database" "metadata" {
  name                = var.database
  resource_group_name = azurerm_resource_group.controlrg.name
  server_name         = azurerm_postgresql_server.unionstation.name
  charset             = "UTF8"
  collation           = "English_United States.1252"
}

resource "azurerm_postgresql_database" "controldb" {
  name                = var.database
  resource_group_name = azurerm_resource_group.controlrg.name
  server_name         = azurerm_postgresql_server.unionstation.name
  charset             = "UTF8"
  collation           = "English_United States.1252"
}

resource "azurerm_postgresql_firewall_rule" "pgfirewallrule" {
  name                = "allow-azure-internal"
  resource_group_name = azurerm_resource_group.controlrg.name
  server_name         = azurerm_postgresql_server.unionstation.name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}

resource "azurerm_container_group" "hasura" {
  name                = "hasura-api-layer"
  location            = azurerm_resource_group.controlrg.location
  resource_group_name = azurerm_resource_group.controlrg.name
  ip_address_type     = "public"
  dns_name_label      = "control"
  os_type             = "Linux"

  container {
    name   = "hasura-data-layer"
    image  = "hasura/graphql-engine:v2.0.0-beta.1"
    cpu    = "0.5"
    memory = "1.5"

    ports {
      port     = var.apiport
      protocol = "TCP"
    }

    environment_variables = {
      HASURA_GRAPHQL_SERVER_PORT    = var.apiport
      HASURA_GRAPHQL_ENABLE_CONSOLE = false
      HASURA_GRAPHQL_DEV_MODE = false
      HASURA_GRAPHQL_ENABLED_LOG_TYPES = "startup, http-log, webhook-log, websocket-log, query-log"
    }
    secure_environment_variables = {
      HASURA_GRAPHQL_DATABASE_URL = "postgres://${var.username}%40${azurerm_postgresql_server.unionstation.name}:${var.password}@${azurerm_postgresql_server.unionstation.fqdn}:5432/${var.database}"
      HASURA_GRAPHQL_ADMIN_SECRET = var.password
    }
  }

  tags = {
    environment = "datalayer"
  }
}

variable "database" {
  type = string
}

variable "server" {
  type = string
}

variable "username" {
  type = string
}

variable "password" {
  type = string
}

variable "apiport" {
  type = number
}

output "hasura_uri_path" {
  value = "${azurerm_container_group.hasura.fqdn}:${var.apiport}"
}

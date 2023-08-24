data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "main" {
  name                       = var.keyvault_name
  location                   = var.location
  resource_group_name        = var.rg_name
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days = 7
  purge_protection_enabled   = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    secret_permissions = [
      "Get", "List", "Set", "Delete", "Restore", "Purge", "Recover"
    ]
  }
}

resource "azurerm_key_vault_secret" "keyvault_secrets" {

  for_each     = var.secrets
  name         = each.value.secret_name
  value        = each.value.secret_value
  key_vault_id = azurerm_key_vault.main.id
}
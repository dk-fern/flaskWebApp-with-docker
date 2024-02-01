terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.89.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

resource "azurerm_service_plan" "service-plan" {
  name                = var.app_service_plan_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name

  os_type  = "Linux"
  sku_name = "F1"

  depends_on = [
    azurerm_resource_group.rg,
  ]
}

resource "azurerm_linux_web_app" "web-app" {
  name                = var.app_service_name
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  service_plan_id     = azurerm_service_plan.service-plan.id

  app_settings = {
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"
  }

  site_config {
    always_on = "false"
    #app_command_line = "python app.py"
    application_stack {
      docker_image_name   = "dkfern/flask-web-app:latest"
      docker_registry_url = "https://index.docker.io"
    }
  }

  depends_on = [
    azurerm_service_plan.service-plan,
  ]
}

output "web_app_url" {
  value = azurerm_linux_web_app.web-app.default_hostname
}
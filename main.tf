resource "azurerm_application_insights" "this" {
  name                                  = join("", var.name_strings)
  location                              = var.location
  resource_group_name                   = var.resource_group_name
  application_type                      = var.application_type
  daily_data_cap_in_gb                  = var.daily_data_cap_in_gb
  daily_data_cap_notifications_disabled = var.daily_data_cap_notifications_disabled
  retention_in_days                     = var.retention_in_days
  sampling_percentage                   = var.sampling_percentage
  disable_ip_masking                    = var.disable_ip_masking

}

# tags = merge({
#   Module-Name = "Application Insights"
#   Author      = "bytejunkie - matt@bytejunkie.dev"
#   },
#   var.tags
# )


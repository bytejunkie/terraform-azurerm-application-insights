variable "name_separator" {
  description = "the character to use to separate the strings used to build the name - override with empty string if none required"
  type        = string
  default     = "-"
}

variable "name_strings" {
  description = "a list of strings to concatenate into a name - useful when templating a naming convention"
  type        = list(string)
}

variable "tags" {
  type        = map(any)
  description = "(Optional) A map of tags to assign to the resource."
  default     = {}
}

variable "resource_group_name" {
  description = "(Required) The name of the resource group in which to create the Application Insights component."
  type        = string
}

variable "location" {
  description = "(Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
  type        = string
}

variable "application_type" {
  description = "description"
  type        = string
  default     = "web"

  validation {
    condition     = var.application_type == "ios" || var.application_type == "java" || var.application_type == "MobileCenter" || var.application_type == "Node.js" || var.application_type == "other" || var.application_type == "phone" || var.application_type == "store" || var.application_type == "web"
    error_message = "Check Documentation for application types."
  }
}

variable "daily_data_cap_in_gb" {
  description = "(Optional) Specifies the Application Insights component daily data volume cap in GB."
  type        = string
  default     = "1"
}

variable "daily_data_cap_notifications_disabled" {
  description = "(Optional) Specifies if a notification email will be send when the daily data volume cap is met."
  type        = string
  default     = "false"
}

variable "retention_in_days" {
  description = "(Optional) Specifies the retention period in days."
  type        = string
  default     = "90"

  validation {
    condition     = var.retention_in_days == "30" || var.retention_in_days == "60" || var.retention_in_days == "90" || var.retention_in_days == "120" || var.retention_in_days == "180" || var.retention_in_days == "270" || var.retention_in_days == "365" || var.retention_in_days == "550" || var.retention_in_days == "730"
    error_message = "Possible values are 30, 60, 90, 120, 180, 270, 365, 550 or 730. Defaults to 90."
  }
}
variable "disable_ip_masking" {
  description = "(Optional) By default the real client ip is masked as 0.0.0.0 in the logs. Use this argument to disable masking and log the real client ip. Defaults to false."
  type        = string
  default     = "false"

  validation {
    condition     = var.disable_ip_masking == "true" || var.disable_ip_masking == "false"
    error_message = "Value should be true or false."
  }
}
variable "sampling_percentage" {
  description = "(Optional) Specifies the percentage of the data produced by the monitored application that is sampled for Application Insights telemetry."
  type        = string
  default     = "100"
}

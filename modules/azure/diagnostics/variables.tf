variable "name" {
  type        = string
  description = "Diagnostic setting name."
}

variable "target_resource_id" {
  type        = string
  description = "Resource ID to apply diagnostics to."
}

variable "log_analytics_workspace_id" {
  type        = string
  description = "Log Analytics workspace ID."
}

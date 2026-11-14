variable "name" {
  description = "Base name for resources (bucket gets a random suffix)."
  type        = string
}

variable "tags" {
  description = "Tags applied to all resources."
  type        = map(string)
  default     = {}
}

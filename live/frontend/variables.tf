variable "region" {
  description = "AWS region for all resources."
  type        = string
  default     = "us-east-1"
}

variable "name" {
  description = "Base name for the site resources."
  type        = string
  default     = "spherex-frontend"
}

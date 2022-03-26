variable "m_vpc_id" {
  type        = string
  description = "The VPC id to deploy the new subnet in"
}

variable "m_cidr_block" {
  type        = string
  description = "CIDR block for the subnet"
}

variable "m_availability_zone" {
  type        = string
  description = "The AZ for the subnet. (example eu-central-1a)"
}

variable "m_map_public_ip_on_launch" {
  type        = bool
  description = <<-EOF
  If set to `true`, network interfaces created in this subnet will have public IP assigned by default
  If set to `false`, network interfaces created in this subnet will not have public IP assigned by default

  Defaults to `false` if no value is specified.
EOF
  default     = false
}

variable "m_app_name" {
  type        = string
  description = "The name of the application which requires this module-specific service"
}

variable "m_environment_tag" {
  type        = string
  description = <<-EOF
  The environment name to be used while tagging the provisioned resources. The list of possible values are as follows:
  - `dev` for development environment
  - `stg` for staging or pre-production environment
  - `prd` for production environment

  Defaults to `dev` (for development environment) if no value is specified.
EOF
  default     = "dev"

  validation {
    condition     = contains(["dev", "stg", "prd"], lower(var.m_environment_tag))
    error_message = "Unsupported environment tag specified. Supported environments are: 'dev', 'stg', and 'prd'."
  }
}

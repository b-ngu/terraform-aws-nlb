variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-west-2"
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "contact" {
  type        = string
  description = "(Required) The contact for this resource."
}

variable "environment" {
  type        = string
  description = "(Required) The environment where this resource will live."
}

variable "team" {
  type        = string
  description = "(Required) The team responsible for this resource."
}

variable "purpose" {
  type        = string
  description = "(Required) The purpose for this resource."
}

variable "subnet_ids" {
  description = "List of subnet IDs"
  type        = list(string)
  default     = []
}

variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "nlb_name" {
  description = "The name of the Network Load Balancer"
  type        = string
  default     = "my-nlb"
}

variable "internal" {
  description = "Whether the NLB should be internal"
  type        = bool
  default     = false
}

variable "enable_deletion_protection" {
  description = "Indicates whether deletion protection is enabled"
  type        = bool
  default     = false
}

variable "enable_cross_zone_load_balancing" {
  description = "Indicates whether cross-zone load balancing is enabled"
  type        = bool
  default     = false
}

variable "target_group_name" {
  description = "The name of the target group"
  type        = string
  default     = "my-target-group"
}

variable "port_configurations" {
  description = "List of configurations for listeners and target groups including ports, protocol, and optional SSL settings"
  type        = list(object({
    listener_port         = number
    target_group_port     = number
    protocol              = string
    certificate_arn       = string
    ssl_policy            = string
  }))
  default     = []
}

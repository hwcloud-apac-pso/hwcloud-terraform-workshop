variable "peering_region" {
  description = "peering Region"
  type        = string
  default     = ""
}

variable "requester_vpc_name" {
  description = "Requester vpc name"
  type        = string
  default     = ""
}

variable "requester_vpc_id" {
  description = "Requester vpc id"
  type        = string
  default     = ""
}

variable "requester_vpc_cidr" {
  description = "The CIDR block for the Requester VPC."
  type        = string
  default     = "0.0.0.0/0"
}

variable "accepter_vpc_name" {
  description = "Accepter vpc name"
  type        = string
  default     = ""
}

variable "accepter_vpc_id" {
  description = "Accepter vpc id"
  type        = string
  default     = ""
}

variable "accepter_vpc_cidr" {
  description = "The CIDR block for the Accepter VPC."
  type        = string
  default     = "0.0.0.0/0"
}
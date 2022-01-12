# Copyright (c) 2019, 2021 Oracle Corporation and/or affiliates.  All rights reserved.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

#terraform.tfvars file

variable "tenancy_ocid" {}
variable "ssh_public_key" {}
variable "compartment_ocid" {}

#AD
variable "AD"{
	default  = "1"
}

# VCN variables
variable "vcn_cidr" {
  description = "The list of IPv4 CIDR blocks the VCN will use."
  default     = "10.0.0.0/16"
}

variable "vcn_dns_label" {
  description = "A DNS label for the VCN"
  default     = "vcnmain"
}

variable "dns_label" {
  description = "A DNS label for the Subnet"
  default     = "subnet"
}

#OS Image
variable "image_operating_system" {
  description = "OS"
  default     = "Oracle Linux"
}

variable "image_operating_system_version" {
  description = "OS Version"
  default     = "7.9"
}

#Compute Shape
variable "instance_shape" {
  description = "The shape of an instance"
  default     = "VM.Standard2.1"
}

#LB Shape
variable "load_balancer_min_band" {
  description = "LB minimum bandwidth"
  default     = "10"
}

variable "load_balancer_max_band" {
  description = "LB maximum bandwidth"
  default     = "100"
}

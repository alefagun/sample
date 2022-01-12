# Copyright (c) 2019, 2021 Oracle Corporation and/or affiliates.  All rights reserved.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

#Get ADs list
data "oci_identity_availability_domains" "ADs" {
	compartment_id = var.tenancy_ocid
}

#Get OS image supported
data "oci_core_images" "compute_images" {
	compartment_id 				= var.compartment_ocid
	operating_system 			= var.image_operating_system
	operating_system_version 	= var.image_operating_system_version
	shape						= var.instance_shape
}

# Copyright (c) 2019, 2021 Oracle Corporation and/or affiliates.  All rights reserved.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

#VCN
resource "oci_core_virtual_network" "vcn" {
	compartment_id	= var.compartment_ocid
	cidr_block 		= var.vcn_cidr 
	dns_label		= var.dns_label
	display_name	= var.dns_label
}

#Internet Gateway
resource "oci_core_internet_gateway" "igw" {
	compartment_id	= var.compartment_ocid
	display_name	= "${var.dns_label}_igw"
	vcn_id 			= oci_core_virtual_network.vcn.id
}

#Route table
resource "oci_core_route_table" "rt" {
	compartment_id	= var.compartment_ocid
	display_name	= "${var.dns_label}_rt"
	vcn_id 			= oci_core_virtual_network.vcn.id
	route_rules {
		destination = "0.0.0.0/0"
		network_entity_id = oci_core_internet_gateway.igw.id
	}
}

#Subnet
resource "oci_core_subnet" "subnet" {
	compartment_id		= var.compartment_ocid
	dns_label			= var.dns_label
	display_name		= var.dns_label
	vcn_id 				= oci_core_virtual_network.vcn.id
	cidr_block			= cidrsubnet(var.vcn_cidr, 8, 1)
	route_table_id		= oci_core_route_table.rt.id
	security_list_ids	= [oci_core_security_list.securitylist.id] 
}

#SL
resource "oci_core_security_list" "securitylist" {
	compartment_id		= var.compartment_ocid
	display_name		= "SL Public"
	vcn_id 			= oci_core_virtual_network.vcn.id
	
	egress_security_rules {
		protocol 	= "all"
		destination	= "0.0.0.0/0" 
	}
	
	ingress_security_rules {
		protocol 	= "6"
		source	= "0.0.0.0/0" 
		tcp_options {
			min = 80
			max = 80
		}
	}
	
	ingress_security_rules {
		protocol 	= "6"
		source	= "0.0.0.0/0" 
		tcp_options {
			min = 22
			max = 22
		}
	}	
}

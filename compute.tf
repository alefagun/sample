# Copyright (c) 2019, 2021 Oracle Corporation and/or affiliates.  All rights reserved.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

#Compute Instances

#data "template_file" "user_data" {
#	template = file("web-script.sh")
#}

resource "oci_core_instance" "web-01" {
	availability_domain = data.oci_identity_availability_domains.ADs.availability_domains[var.AD -1]["name"]
	compartment_id 		= var.compartment_ocid
	display_name		= "Web-Server-01"
	shape				= var.instance_shape

	create_vnic_details {
		subnet_id = oci_core_subnet.subnet.id
		display_name = "Web-Server-01"
	}
	source_details {
		source_type = "image"
		source_id 	= lookup(data.oci_core_images.compute_images.images[0], "id")
		boot_volume_size_in_gbs = "50"
	}
}


resource "oci_core_instance" "web-02" {
	availability_domain = data.oci_identity_availability_domains.ADs.availability_domains[var.AD -1]["name"]
	compartment_id 		= var.compartment_ocid
	display_name		= "Web-Server-02"
	shape				= var.instance_shape

	create_vnic_details {
		subnet_id = oci_core_subnet.subnet.id
		display_name = "Web-Server-02"
	}
	source_details {
		source_type = "image"
		source_id 	= lookup(data.oci_core_images.compute_images.images[0], "id")
		boot_volume_size_in_gbs = "50"
	}
}

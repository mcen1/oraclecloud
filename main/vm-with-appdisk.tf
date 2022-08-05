
resource "oci_core_instance" "ocivm" {
  for_each = var.informations
  availability_domain = each.value.availability_domain 
  compartment_id      = each.value.compartment_id
  create_vnic_details {
    assign_public_ip = false
    display_name     = "${each.value.vmname}-vnic"
    hostname_label   = "${each.value.vmname}"
    subnet_id        = each.value.subnet_id
  }

  display_name = each.value.vmname

  launch_options {
    boot_volume_type = "PARAVIRTUALIZED"
    network_type     = "PARAVIRTUALIZED"
  }

  # prevent the bastion from destroying and recreating itself if the image ocid changes 
  lifecycle {
    ignore_changes = [source_details[0].source_id]
  }
  fault_domain = each.value.fault_domain

  metadata = {
    ssh_authorized_keys = "ssh-rsa AAAAdfjnskjdskjksjd\n${each.value.sshpubkey}"
  }

  shape = each.value.shape

  shape_config{
      ocpus         = each.value.cpu
      memory_in_gbs = each.value.memory
  }

  source_details {
    boot_volume_size_in_gbs = 50
    source_type             = "image"
    # retrieve via gui
    source_id               = each.value.source_id
  }

  
  timeouts {
    create = "60m"
  }

}

resource "oci_core_volume" "appvolume" {
    #Required
    for_each = var.informations
    availability_domain = each.value.availability_domain 
    compartment_id = each.value.compartment_id
    display_name = "${each.value.vmname}appdisk" 
    #is_auto_tune_enabled = var.volume_is_auto_tune_enabled
    size_in_gbs = 50
    vpus_per_gb = 10
    block_volume_replicas_deletion = true
}

resource "oci_core_volume_attachment" "attach_volume_to_vm" {
    for_each = var.informations
    attachment_type = each.value.attachment_type 
    instance_id = oci_core_instance.ocivm[each.key].id
    volume_id = oci_core_volume.appvolume[each.key].id

    #Optional
    #device = var.volume_attachment_device
    #display_name = var.volume_attachment_display_name
    #encryption_in_transit_type = var.volume_attachment_encryption_in_transit_type
    #is_agent_auto_iscsi_login_enabled = var.volume_attachment_is_agent_auto_iscsi_login_enabled
    #is_pv_encryption_in_transit_enabled = var.volume_attachment_is_pv_encryption_in_transit_enabled
    #is_read_only = var.volume_attachment_is_read_only
    #is_shareable = var.volume_attachment_is_shareable
    #use_chap = var.volume_attachment_use_chap
}

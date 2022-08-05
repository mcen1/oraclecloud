terraform {
  required_version = ">=1.0.3"

  backend "remote" {
    hostname     = "app.terraform.io"
    organization = ""

    workspaces {
      name = ""
    }
  }
}

locals {

}

module "main" {
  source         = "../main"
  tenancy        = var.tenancy
  fingerprint    = var.fingerprint
  private_key    = var.private_key
  user_ocid      = var.user_ocid
  region         = var.region
  informations   = {
    "server1" = {
      vmname              = "server1",
      compartment_id      = "ocid1.compartment.oc1..",
      tenancy             = var.tenancy,
      fingerprint         = var.fingerprint,
      private_key         = var.private_key,
      shape               = "VM.Standard.E4.Flex",
      source_id           = "ocid1.image.oc1.iad.",
      subnet_id           = "ocid1.subnet.oc1.iad.",
      availability_domain = "MeMu:US-ASHBURN-AD-1",
      shape               = "VM.Standard.E4.Flex",
      fault_domain        = "FAULT-DOMAIN-3",
      cpu                 = 2,
      memory              = 8,
      appdisk             = 50,
      sshpubkey           = "ssh-rsa ",
      attachment_type    = "paravirtualized"
    },
    "server2" = {
      vmname              = "server2",
      compartment_id      = "ocid1.compartment.oc1..",
      tenancy             = var.tenancy,
      fingerprint         = var.fingerprint,
      private_key         = var.private_key,
      shape               = "VM.Standard.E4.Flex",
      source_id           = "ocid1.image.oc1.iad.",
      subnet_id           = "ocid1.subnet.oc1.iad.",
      availability_domain = "MeMu:US-ASHBURN-AD-1",
      shape               = "VM.Standard.E4.Flex",
      fault_domain        = "FAULT-DOMAIN-1",
      cpu                 = 2,
      memory              = 8,
      appdisk             = 50,
      sshpubkey           = "ssh-rsa ",
      attachment_type    = "paravirtualized"
    },
  } 
}



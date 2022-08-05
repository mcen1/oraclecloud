provider "oci" {
  tenancy_ocid         = var.tenancy
  user_ocid            = var.user_ocid
  fingerprint          = var.fingerprint
  private_key          = var.private_key
  region               = var.region
}

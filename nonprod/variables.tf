variable "tenancy" {
#  default = "ocid1.tenancy.oc1.."
  type    = string
}
variable "fingerprint" {
  type    = string
}
variable "private_key" {
  type    = string
}
variable "user_ocid" {
  type    = string
}
variable "region" {
  type    = string
  default = "us-ashburn-1"
}

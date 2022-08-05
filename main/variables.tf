variable "informations" {
  default = {}
  type = map(object({
      vmname              = string
      compartment_id      = string
      shape               = string
      source_id           = string
      subnet_id           = string
      availability_domain = string
      sshpubkey           = string
      fault_domain        = string
      cpu                 = number 
      memory              = number
      appdisk             = number
      attachment_type     = string
  }))
}

variable "tenancy" {
#  default = "ocid1.tenancy.oc1..aaaaaaaare7ejayr25bb5ddo2pedb7hjijpecl4qqvvvxh7oenmxhmk343qa"
  type    = string
}
variable "fingerprint" {
  type    = string
}
variable "private_key" {
  type    = string
}
#variable "compartment_id" {
#  type    = string
#}
variable "user_ocid" {
   type    = string
}
variable "region" {
   type    = string
}

variable "org_id" {}
variable "billing_account" {}
variable "hosted_project_name" {}
variable "credentials_file_path" {}
variable "network_name" {}
variable "subnets" {
  type = list
}
variable "secondary_ranges" {
  type = map
}

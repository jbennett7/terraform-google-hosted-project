module "host-project" {
  source = "github.com/terraform-google-modules/terraform-google-project-factory"
  random_project_id = true
  name = var.hosted_project_name
  org_id = var.org_id
  billing_account = var.billing_account
  credentials_path = var.credentials_file_path
}

module "vpc" {
  source = "github.com/terraform-google-modules/terraform-google-network.git?ref=master"
  project_id = module.host-project.project_id
  network_name = var.network_name
  delete_default_internet_gateway_routes = true
  shared_vpc_host = true
  subnets = var.subnets
  secondary_ranges = var.secondary_ranges
}

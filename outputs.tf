output "subnetworks" {
  value = module.vpc.subnets_self_links
}

output "hosted_project_id" {
  value = module.host-project.project_id
}

output "org_id" {
  value = var.org_id
  sensitive = true
}

output "billing_account" {
  value = var.billing_account
  sensitive = true
}

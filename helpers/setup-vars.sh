#!/bin/bash
BILLING_ACCOUNT=$(gcloud alpha billing accounts list --format="value(ACCOUNT_ID)")
ORG_ID=$(gcloud organizations list --format="value(ID)")
cat <<EOF > terraform.tfvars
org_id = "${ORG_ID}"
billing_account = "${BILLING_ACCOUNT}"
credentials_file_path = "./credentials.json"
network_name = "shared-vpc"
subnets = [{
    subnet_name = "subnet-01"
    subnet_ip = "10.10.10.0/24"
    subnet_region = "us-west1"
    subnet_flow_logs = true
  },{
    subnet_name = "subnet-02"
    subnet_ip = "10.10.20.0/24"
    subnet_region = "us-west1"
    subnet_flow_logs = true
}]
secondary_ranges = {
    subnet-01 = [{
        range_name = "subnet-01-01"
        ip_cidr_range = "192.168.64.0/24"
      },{
        range_name = "subnet-01-02"
        ip_cidr_range = "192.168.65.0/24"
      }]
    subnet-02 = [{
        range_name = "subnet-02-01"
        ip_cidr_range = "192.168.128.0/24"
    }]
}
EOF

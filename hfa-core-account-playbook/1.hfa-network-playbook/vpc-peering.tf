module "common_service_vpc_2_transit_service_ingress_vpc" {
  source = "../../terraform-hwcloud-modules/terraform-hwcloud-vpcpeering-multi-account"
  peering_region = module.global_variables.default_region

  requester_access_key = module.global_variables.general_service_account_ak
  requester_secret_key = module.global_variables.general_service_account_sk
  requester_vpc_name = var.common_service_vpc
  requester_vpc_id = module.common_service_vpc.vpc_id
  requester_vpc_cidr = var.common_service_vpc_cidr

  accepter_access_key = module.global_variables.general_service_account_ak
  accepter_secret_key = module.global_variables.general_service_account_sk
  accepter_vpc_name = var.transit_service_ingress_vpc
  accepter_vpc_id = module.transit_service_ingress_vpc.vpc_id
  accepter_vpc_cidr = var.transit_service_ingress_vpc_cidr
  accepter_iam_region_project_id = var.general_iam_region_project_id
}

module "prod_vpc_2_transit_service_ingress_vpc" {
  source = "../../terraform-hwcloud-modules/terraform-hwcloud-vpcpeering-multi-account"
  peering_region = module.global_variables.default_region

  requester_access_key = module.global_variables.general_service_account_ak
  requester_secret_key = module.global_variables.general_service_account_sk
  requester_vpc_name = var.prod_vpc
  requester_vpc_id = module.prod_vpc.vpc_id
  requester_vpc_cidr = var.prod_vpc_cidr

  accepter_access_key = module.global_variables.general_service_account_ak
  accepter_secret_key = module.global_variables.general_service_account_sk
  accepter_vpc_name = var.transit_service_ingress_vpc
  accepter_vpc_id = module.transit_service_ingress_vpc.vpc_id
  accepter_vpc_cidr = var.transit_service_ingress_vpc_cidr
  accepter_iam_region_project_id = var.general_iam_region_project_id
}

module "common_service_vpc_2_transit_service_egress_vpc" {
  source = "../../terraform-hwcloud-modules/terraform-hwcloud-vpcpeering-multi-account"
  peering_region = module.global_variables.default_region

  requester_access_key = module.global_variables.general_service_account_ak
  requester_secret_key = module.global_variables.general_service_account_sk
  requester_vpc_name = var.common_service_vpc
  requester_vpc_id = module.common_service_vpc.vpc_id
  requester_vpc_cidr = var.common_service_vpc_cidr

  accepter_access_key = module.global_variables.general_service_account_ak
  accepter_secret_key = module.global_variables.general_service_account_sk
  accepter_vpc_name = var.transit_service_egress_vpc
  accepter_vpc_id = module.transit_service_egress_vpc.vpc_id
  accepter_vpc_cidr = var.transit_service_egress_vpc_cidr
  accepter_iam_region_project_id = var.general_iam_region_project_id
}

module "prod_vpc_2_transit_service_egress_vpc" {
  source = "../../terraform-hwcloud-modules/terraform-hwcloud-vpcpeering-multi-account"
  peering_region = module.global_variables.default_region

  requester_access_key = module.global_variables.general_service_account_ak
  requester_secret_key = module.global_variables.general_service_account_sk
  requester_vpc_name = var.prod_vpc
  requester_vpc_id = module.prod_vpc.vpc_id
  requester_vpc_cidr = var.prod_vpc_cidr

  accepter_access_key = module.global_variables.general_service_account_ak
  accepter_secret_key = module.global_variables.general_service_account_sk
  accepter_vpc_name = var.transit_service_egress_vpc
  accepter_vpc_id = module.transit_service_egress_vpc.vpc_id
  accepter_vpc_cidr = var.transit_service_egress_vpc_cidr
  accepter_iam_region_project_id = var.general_iam_region_project_id
}
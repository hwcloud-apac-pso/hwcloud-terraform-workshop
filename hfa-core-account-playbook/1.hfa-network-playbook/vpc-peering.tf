module "common_service_vpc_2_transit_prod_env_ingress_vpc" {
  source = "../../terraform-hwcloud-modules/terraform-hwcloud-vpcpeering-single-account"

  requester_vpc_name = var.common_service_vpc
  requester_vpc_id = module.common_service_vpc.vpc_id
  requester_vpc_cidr = var.common_service_vpc_cidr

  accepter_vpc_name = var.transit_service_prod_ingress_vpc
  accepter_vpc_id = module.transit_service_prod_ingress_vpc.vpc_id
  accepter_vpc_cidr = var.transit_prod_ingress_vpc_cidr

  providers = {
    huaweicloud = huaweicloud.general_service
  }
}

module "common_service_vpc_2_transit_prod_egress_vpc" {
  source = "../../terraform-hwcloud-modules/terraform-hwcloud-vpcpeering-single-account"

  requester_vpc_name = var.common_service_vpc
  requester_vpc_id = module.common_service_vpc.vpc_id
  requester_vpc_cidr = var.common_service_vpc_cidr

  accepter_vpc_name = var.transit_service_prod_egress_vpc
  accepter_vpc_id = module.transit_service_prod_egress_vpc.vpc_id
  accepter_vpc_cidr = var.transit_prod_egress_vpc_cidr

  providers = {
    huaweicloud = huaweicloud.general_service
  }
}

module "prod_env_vpc_2_transit_prod_env_ingress_vpc" {
  source = "../../terraform-hwcloud-modules/terraform-hwcloud-vpcpeering-single-account"

  requester_vpc_name = var.prod_env_vpc
  requester_vpc_id = module.prod_env_vpc.vpc_id
  requester_vpc_cidr = var.prod_env_vpc_cidr

  accepter_vpc_name = var.transit_service_prod_ingress_vpc
  accepter_vpc_id = module.transit_service_prod_ingress_vpc.vpc_id
  accepter_vpc_cidr = var.transit_prod_ingress_vpc_cidr
  
  providers = {
    huaweicloud = huaweicloud.general_service
  }
}

module "prod_env_vpc_2_transit_prod_env_egress_vpc" {
  source = "../../terraform-hwcloud-modules/terraform-hwcloud-vpcpeering-single-account"

  requester_vpc_name = var.prod_env_vpc
  requester_vpc_id = module.prod_env_vpc.vpc_id
  requester_vpc_cidr = var.prod_env_vpc_cidr

  accepter_vpc_name = var.transit_service_prod_egress_vpc
  accepter_vpc_id = module.transit_service_prod_egress_vpc.vpc_id
  accepter_vpc_cidr = var.transit_prod_egress_vpc_cidr
  
  providers = {
    huaweicloud = huaweicloud.general_service
  }
}
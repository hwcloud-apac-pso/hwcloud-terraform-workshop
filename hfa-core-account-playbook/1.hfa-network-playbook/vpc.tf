module "common_service_vpc" {
  source = "../../terraform-hwcloud-modules/terraform-hwcloud-vpc"
  
  name = "${var.common_service_vpc}"
  vpc_cidr = var.common_service_vpc_cidr
  private_subnet_cidr = var.common_private_subnet_cidr
  database_subnet_cidr = var.common_database_subnet_cidr
  cce_subnet_cidr = var.common_cce_subnet_cidr

  providers = {
    huaweicloud = huaweicloud.general_service
  }
}

module "transit_service_prod_ingress_vpc" {
  source = "../../terraform-hwcloud-modules/terraform-hwcloud-vpc"
  
  name = "${var.transit_service_prod_ingress_vpc}"
  vpc_cidr = var.transit_prod_ingress_vpc_cidr
  ingress_subnet_cidr = var.transit_prod_ingress_subnet_cidr

  providers = {
    huaweicloud = huaweicloud.general_service
  }
}

module "transit_service_prod_egress_vpc" {
  source = "../../terraform-hwcloud-modules/terraform-hwcloud-vpc"
  
  name = "${var.transit_service_prod_egress_vpc}"
  vpc_cidr = var.transit_prod_egress_vpc_cidr
  egress_subnet_cidr = var.transit_prod_egress_subnet_cidr
  egress_nat_gw_name = var.transit_prod_egress_nat_gw_name

  providers = {
    huaweicloud = huaweicloud.general_service
  }
}

module "prod_env_vpc" {
  source = "../../terraform-hwcloud-modules/terraform-hwcloud-vpc"
  
  name = var.prod_env_vpc
  vpc_cidr = var.prod_env_vpc_cidr
  
  private_subnet_cidr = var.prod_private_subnet_cidr
  cce_subnet_cidr = var.prod_cce_subnet_cidr
  database_subnet_cidr = var.prod_database_subnet_cidr
  
  providers = {
    huaweicloud = huaweicloud.general_service
  }
}
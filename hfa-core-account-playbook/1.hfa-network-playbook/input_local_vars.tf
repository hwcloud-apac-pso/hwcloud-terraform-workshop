## for transit service  prod
variable transit_service_prod_ingress_vpc { default = "transit_prod_ingress_vpc" }
variable transit_prod_ingress_vpc_cidr { default = "10.17.0.0/16" }
variable transit_prod_ingress_subnet_cidr { default = "10.17.0.0/20" }

variable transit_service_prod_egress_vpc { default = "transit_prod_egress_vpc" }
variable transit_prod_egress_vpc_cidr { default = "10.18.0.0/16" }
variable transit_prod_egress_subnet_cidr  { default = "10.18.0.0/20" }
variable transit_prod_egress_nat_gw_name  { default = "egress_prod_nat_gw" }

## for common Service
variable common_service_vpc { default = "common_service_vpc" }
variable common_service_vpc_cidr { default = "10.19.0.0/16" }
variable common_private_subnet_cidr { default = "10.19.0.0/22" }
variable common_cce_subnet_cidr { default = "10.19.4.0/22" }
variable common_database_subnet_cidr { default = "10.19.10.0/24" }

### for prod account 
variable prod_env_vpc { default = "prod_env_vpc" }
variable prod_env_vpc_cidr { default = "10.100.0.0/16" }
variable prod_private_subnet_cidr { default = "10.100.0.0/22" }
variable prod_cce_subnet_cidr { default = "10.100.4.0/22" }
variable prod_database_subnet_cidr { default = "10.100.10.0/24" }


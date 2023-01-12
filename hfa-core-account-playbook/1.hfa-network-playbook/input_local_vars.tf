## for transit service  prod
variable transit_service_prod_ingress_vpc { default = "please-insert-info-here" }
variable transit_prod_ingress_vpc_cidr { default = "please-insert-info-here" }
variable transit_prod_ingress_subnet_cidr { default = "please-insert-info-here" }

variable transit_service_prod_egress_vpc { default = "please-insert-info-here" }
variable transit_prod_egress_vpc_cidr { default = "please-insert-info-here" }
variable transit_prod_egress_subnet_cidr  { default = "please-insert-info-here" }
variable transit_prod_egress_nat_gw_name  { default = "please-insert-info-here" }

## for common Service
variable common_service_vpc { default = "please-insert-info-here" }
variable common_service_vpc_cidr { default = "please-insert-info-here" }
variable common_private_subnet_cidr { default = "please-insert-info-here" }
variable common_cce_subnet_cidr { default = "please-insert-info-here" }
variable common_database_subnet_cidr { default = "please-insert-info-here" }

### for prod account 
variable prod_env_vpc { default = "please-insert-info-here" }
variable prod_env_vpc_cidr { default = "please-insert-info-here" }
variable prod_private_subnet_cidr { default = "please-insert-info-here" }
variable prod_cce_subnet_cidr { default = "please-insert-info-here" }
variable prod_database_subnet_cidr { default = "please-insert-info-here" }
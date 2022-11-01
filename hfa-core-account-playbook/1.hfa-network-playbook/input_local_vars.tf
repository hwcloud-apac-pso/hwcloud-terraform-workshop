## for common Service (private, cce and database)
variable common_service_vpc { default = "common_service_vpc" }
variable common_service_vpc_cidr { default = "10.16.0.0/16" }
variable common_private_subnet_cidr { default = "10.16.0.0/22" }
variable common_cce_subnet_cidr { default = "10.16.4.0/22" }
variable common_database_subnet_cidr { default = "10.16.10.0/24" }

## for transit service (production egress)
variable transit_service_egress_vpc { default = "transit_service_egress_vpc" }
variable transit_service_egress_vpc_cidr { default = "10.18.0.0/16" }
variable transit_service_prod_egress_subnet_cidr { default = "10.18.0.0/20" }
variable transit_service_prod_egress_nat_gw_name  { default = "egress_prod_nat_gw" }

## for transit service (production ingress)
variable transit_service_ingress_vpc { default = "transit_service_ingress_vpc" }
variable transit_service_ingress_vpc_cidr { default = "10.19.0.0/16" }
variable transit_service_prod_ingress_subnet_cidr { default = "10.19.0.0/20" }

## for production
variable prod_vpc { default = "prod_vpc" }
variable prod_vpc_cidr { default = "10.20.0.0/16" }
variable prod_vpc_private_subnet_cidr { default = "10.20.0.0/22" }
variable prod_vpc_cce_subnet_cidr { default = "10.20.4.0/22" }
variable prod_vpc_database_subnet_cidr { default = "10.20.10.0/24" }

## for peering , get the account project id from "My Credentials"--> "API Credentials" --> "projects" --> "project id/region"
variable general_iam_region_project_id { default = "89f7a020c8eb4955b89905706b483deb" }
output "common_vpc_id" {
  value       = module.common_service_vpc.vpc_id
  description = "Common Account VPC ID"
}

output "prod_vpc_id" {
  value       = module.prod_env_vpc.vpc_id
  description = "Production Account VPC ID"
}

output "transit_prod_ingress_vpc_id" {
  value       = module.transit_service_prod_ingress_vpc.vpc_id
  description = "Transit Account Ingress VPC ID"
}

output "transit_prod_egress_vpc_id" {
  value       = module.transit_service_prod_egress_vpc.vpc_id
  description = "Transit Account Egress VPC ID"
}

output "common_private_subnet_id" {
   value       = module.common_service_vpc.private_subnet_id 
   description = "Common Service Account VPC Private subnet ID"
}

output "prod_private_subnet_id" {
   value       = module.prod_env_vpc.private_subnet_id 
   description = "Production Account VPC Private subnet ID"
}

output "transit_prod_ingress_subnet_id" {
   value       = module.transit_service_prod_ingress_vpc.ingress_subnet_id
   description = "Transit Prod Ingress VPC Private subnet ID"
}

output "transit_prod_egress_subnet_id" {
   value       = module.transit_service_prod_egress_vpc.egress_subnet_id
   description = "Transit Prod Egress VPC Private subnet ID"
}

output "transit_egress_nat_gw_id" {
   value = module.transit_service_prod_egress_vpc.egress_nat_gw_id
   description = "Transit Account Egress NAT GW ID"
}

output "transit_egress_nat_gw_eip" {
   value = module.transit_service_prod_egress_vpc.egress_nat_gw_eip
   description = "Transit Account Egress NAT GW EIP"
}

output "common_requester_vpc_peering_id" {
  value = module.common_service_vpc_2_transit_prod_egress_vpc.requester_vpc_peering_id
  description = "Common Account Requester VPC Peering id"
}
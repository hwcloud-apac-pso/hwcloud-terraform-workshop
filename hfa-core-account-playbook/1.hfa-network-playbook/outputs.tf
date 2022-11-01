output "common_vpc_id" {
  value       = module.common_service_vpc.vpc_id
  description = "Common Service VPC ID"
}

output "prod_vpc_id" {
  value       = module.prod_vpc.vpc_id
  description = "Production VPC ID"
}

output "transit_ingress_vpc_id" {
  value       = module.transit_service_ingress_vpc.vpc_id
  description = "Transit Service VPC ID"
}

output "transit_egress_vpc_id" {
  value       = module.transit_service_egress_vpc.vpc_id
  description = "Transit Service VPC ID"
}

output "common_private_subnet_id" {
   value       = module.common_service_vpc.private_subnet_id 
   description = "Common Service Private subnet ID"
}

output "prod_private_subnet_id" {
   value       = module.prod_vpc.private_subnet_id 
   description = "Common Service Private subnet ID"
}

output "transit_ingress_subnet_id" {
   value       = module.transit_service_ingress_vpc.ingress_subnet_id
   description = "Common Service Ingress subnet ID"
}

output "transit_egress_subnet_id" {
   value       = module.transit_service_egress_vpc.egress_subnet_id
   description = "Common Service Egress subnet ID"
}

## for general account
output "transit_egress_nat_gw_id" {
   value = module.transit_service_egress_vpc.egress_nat_gw_id
   description = "Transit Egress NAT GW ID"
}

output "common_requester_vpc_peering_id" {
  value = module.common_service_vpc_2_transit_service_egress_vpc.requester_vpc_peering_id
  description = "Common Service Requester VPC Peering id"
}

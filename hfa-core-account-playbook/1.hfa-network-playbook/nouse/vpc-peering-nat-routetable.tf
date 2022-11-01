## add snat rule in egress account 
## add default gateway in common service account 

### South-West outbound traffic: Transit Nat GW  - add snat rule for common cidr
resource "huaweicloud_nat_snat_rule" "egress_snat_rule_for_common_service" {
  provider = huaweicloud.general_service
  nat_gateway_id = module.transit_service_egress_vpc.egress_nat_gw_id
  floating_ip_id = module.transit_service_egress_vpc.egress_nat_gw_eip
  source_type    = 1 # Direct Connect Scenario
  cidr           = var.common_service_vpc_cidr
}

resource "huaweicloud_vpc_route" "common-route" {
  provider = huaweicloud.general_service
  vpc_id         = module.common_service_vpc.vpc_id
  destination    = var.prod_vpc_cidr
  type           = "peering"
  nexthop        = module.common_service_vpc_2_transit_service_ingress_vpc.requester_vpc_peering_id
}

resource "huaweicloud_vpc_route" "prod-route" {
  provider = huaweicloud.general_service
  vpc_id         = module.prod_vpc.vpc_id
  destination    = var.common_service_vpc_cidr
  type           = "peering"
  nexthop        = module.prod_vpc_2_transit_service_ingress_vpc.requester_vpc_peering_id
}
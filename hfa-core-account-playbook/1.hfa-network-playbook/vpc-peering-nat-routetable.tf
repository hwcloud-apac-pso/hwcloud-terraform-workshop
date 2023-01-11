# ## add snat rule in egress account 
# ## add default gateway in common service account 

### North-South oubound : Transit Nat GW  - add snat rule for common cidr
resource "huaweicloud_nat_snat_rule" "egress_snat_rule_for_common_service" {
  provider = huaweicloud.general_service
  nat_gateway_id = module.transit_service_prod_egress_vpc.egress_nat_gw_id
  floating_ip_id = module.transit_service_prod_egress_vpc.egress_nat_gw_eip
  source_type    = 0
  cidr           = var.common_service_vpc_cidr
}

#### North-South outbound Traffic : common --> transit egress --> internet
resource "huaweicloud_vpc_route" "vpc_route" { 
  provider = huaweicloud.general_service
  vpc_id         = module.common_service_vpc.vpc_id
  destination    = "0.0.0.0/0"
  type           = "peering"
  nexthop        = module.common_service_vpc_2_transit_prod_egress_vpc.requester_vpc_peering_id
}

###  East-West Traffic : common --> transit ingress -->  prod
resource "huaweicloud_vpc_route" "common_2_security_route" { 
  provider = huaweicloud.general_service
  vpc_id         = module.common_service_vpc.vpc_id
  destination    = var.prod_env_vpc_cidr
  type           = "peering"
  nexthop        = module.common_service_vpc_2_transit_prod_env_ingress_vpc.requester_vpc_peering_id
}

### East-West Traffic : prod --> transit ingress --> common
resource "huaweicloud_vpc_route" "security_2_common_route" { 
  provider = huaweicloud.general_service
  vpc_id         = module.prod_env_vpc.vpc_id
  destination    = var.common_service_vpc_cidr
  type           = "peering"
  nexthop        = module.prod_env_vpc_2_transit_prod_env_ingress_vpc.requester_vpc_peering_id
}
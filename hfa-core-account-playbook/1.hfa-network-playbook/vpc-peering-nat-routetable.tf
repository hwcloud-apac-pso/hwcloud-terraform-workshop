# ## add snat rule in egress  VPC
# ## add default gateway in common service account 

### North-South oubound : Transit Nat GW  - add snat rule for common cidr
resource "huaweicloud_nat_snat_rule" "egress_snat_rule_for_common_service" {
  provider       = huaweicloud.general_service
  nat_gateway_id = module.transit_service_prod_egress_vpc.egress_nat_gw_id
  floating_ip_id = module.transit_service_prod_egress_vpc.egress_nat_gw_eip
  source_type    = 0
  cidr           = "please-insert-info-here"
}

#### North-South outbound Traffic : common --> transit egress --> internet
resource "huaweicloud_vpc_route" "vpc_route" { 
  provider       = "please-insert-info-here"
  vpc_id         = "please-insert-info-here"
  destination    = "0.0.0.0/0"
  type           = "please-insert-info-here"
  nexthop        = "please-insert-info-here"
}

###  East-West Traffic : common --> transit ingress -->  prod
resource "huaweicloud_vpc_route" "common_2_security_route" { 
  provider       = "please-insert-info-here"
  vpc_id         = "please-insert-info-here"
  destination    = "please-insert-info-here"
  type           = "please-insert-info-here"
  nexthop        = "please-insert-info-here"
}
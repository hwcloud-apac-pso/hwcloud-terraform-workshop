resource "huaweicloud_vpc_peering_connection" "requester" {
  name           = "${var.requester_vpc_name}_peering_${var.accepter_vpc_name}"
  vpc_id         = var.requester_vpc_id
  peer_vpc_id    = var.accepter_vpc_id
}

resource "huaweicloud_vpc_route" "requester_route" {
  vpc_id         = var.requester_vpc_id
  destination    = var.accepter_vpc_cidr
  type           = "peering"
  nexthop        = huaweicloud_vpc_peering_connection.requester.id
  # depends_on = [
  #   huaweicloud_vpc_peering_connection_accepter.accepter,
  # ]
}

resource "huaweicloud_vpc_route" "accepter_route" {
  vpc_id         = var.accepter_vpc_id
  destination    = var.requester_vpc_cidr
  type           = "peering"
  nexthop        = huaweicloud_vpc_peering_connection.requester.id
  # depends_on = [
  #   huaweicloud_vpc_peering_connection_accepter.accepter,
  # ]
}

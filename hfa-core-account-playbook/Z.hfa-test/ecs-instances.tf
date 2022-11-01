resource "huaweicloud_networking_secgroup" "sg_default" {
  provider = huaweicloud.general_service
  name = "general-icmp"
}

resource "huaweicloud_networking_secgroup_rule" "sg_rule" {
  provider = huaweicloud.general_service
  security_group_id = huaweicloud_networking_secgroup.sg_default.id
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "icmp"
  remote_ip_prefix  = "0.0.0.0/0"
}

resource "huaweicloud_compute_instance" "common_srv_ecs" {
  provider = huaweicloud.general_service
  name              = "ecs-common"
  image_id          = data.huaweicloud_images_image.compute_image.id
  flavor_id         = data.huaweicloud_compute_flavors.compute_flavor.ids[0]
  security_group_ids   = [ huaweicloud_networking_secgroup.sg_default.id ]
  availability_zone = data.huaweicloud_availability_zones.availability_zone.names[0]
  user_data =         base64encode(file("user_data.sh"))

  network {
    uuid = data.terraform_remote_state.network.outputs.common_private_subnet_id
    fixed_ip_v4  = "10.16.0.100"
  }
}

resource "huaweicloud_compute_instance" "prod_ecs" {
  provider = huaweicloud.general_service
  name              = "ecs-prod"
  image_id          = data.huaweicloud_images_image.compute_image.id
  flavor_id         = data.huaweicloud_compute_flavors.compute_flavor.ids[0]
  security_group_ids   = [ huaweicloud_networking_secgroup.sg_default.id ]
  availability_zone = data.huaweicloud_availability_zones.availability_zone.names[0]
  user_data =         base64encode(file("user_data.sh"))

  network {
    uuid = data.terraform_remote_state.network.outputs.prod_private_subnet_id
    fixed_ip_v4  = "10.20.0.100"
  }
}

# resource "huaweicloud_compute_instance" "transit_ingress_ecs" {
#   provider = huaweicloud.general_service
#   name              = "ecs-transit-ingress"
#   image_id          = data.huaweicloud_images_image.compute_image.id
#   flavor_id         = data.huaweicloud_compute_flavors.compute_flavor.ids[0]
#   security_group_ids   = [ huaweicloud_networking_secgroup.sg_default.id ]
#   availability_zone = data.huaweicloud_availability_zones.availability_zone.names[0]
#   user_data =         base64encode(file("user_data.sh"))

#   network {
#     uuid = data.terraform_remote_state.network.outputs.transit_ingress_subnet_id
#     fixed_ip_v4  = "10.19.0.100"
#   }
# }

# resource "huaweicloud_compute_instance" "transit_egress_ecs" {
#   provider = huaweicloud.general_service
#   name              = "ecs-transit-egress"
#   image_id          = data.huaweicloud_images_image.compute_image.id
#   flavor_id         = data.huaweicloud_compute_flavors.compute_flavor.ids[0]
#   security_group_ids   = [ huaweicloud_networking_secgroup.sg_default.id ]
#   availability_zone = data.huaweicloud_availability_zones.availability_zone.names[0]
#   user_data =         base64encode(file("user_data.sh"))

#   network {
#     uuid = data.terraform_remote_state.network.outputs.transit_egress_subnet_id
#     fixed_ip_v4  = "10.18.0.100"
#   }
# }





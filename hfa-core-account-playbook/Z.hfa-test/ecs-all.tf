# Create Security Group

resource "huaweicloud_networking_secgroup" "sg_general" {
  provider = huaweicloud.general_service
  name = "sg-general-icmp"

}
resource "huaweicloud_networking_secgroup_rule" "sg_rule_general" {
  provider = huaweicloud.general_service
  security_group_id = huaweicloud_networking_secgroup.sg_general.id
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "icmp"
  remote_ip_prefix  = "0.0.0.0/0"
}

### Create ECS

resource "huaweicloud_compute_instance" "ecs-common" {
  provider = huaweicloud.general_service
  name              = "ecs-common"
  image_id          = data.huaweicloud_images_image.myimage.id
  flavor_id         = data.huaweicloud_compute_flavors.myflavor.ids[0]
  security_group_ids   = [ huaweicloud_networking_secgroup.sg_general.id ]
  availability_zone = data.huaweicloud_availability_zones.myaz.names[0]
  user_data =         base64encode(file("user_data.sh"))

  network {
    uuid = data.terraform_remote_state.network.outputs.common_private_subnet_id
    fixed_ip_v4  = "10.19.0.101"
  }
}

resource "huaweicloud_compute_instance" "ecs-prod" {
  provider = huaweicloud.general_service
  name              = "ecs-prod"
  image_id          = data.huaweicloud_images_image.myimage.id
  flavor_id         = data.huaweicloud_compute_flavors.myflavor.ids[0]
  security_group_ids   = [ huaweicloud_networking_secgroup.sg_general.id ]
  availability_zone = data.huaweicloud_availability_zones.myaz.names[0]
  user_data =         base64encode(file("user_data.sh"))

  network {
    uuid = data.terraform_remote_state.network.outputs.prod_private_subnet_id
    fixed_ip_v4  = "10.100.0.101"
  }
}

resource "huaweicloud_compute_instance" "ecs-transit-prod-ingress" {
  provider = huaweicloud.general_service
  name              = "ecs-transit-ingress"
  image_id          = data.huaweicloud_images_image.myimage.id
  flavor_id         = data.huaweicloud_compute_flavors.myflavor.ids[0]
  security_group_ids   = [ huaweicloud_networking_secgroup.sg_general.id ]
  availability_zone = data.huaweicloud_availability_zones.myaz.names[0]
  user_data =         base64encode(file("user_data.sh"))

  network {
    uuid = data.terraform_remote_state.network.outputs.transit_prod_ingress_subnet_id
    fixed_ip_v4  = "10.17.0.101"
  }
}

resource "huaweicloud_compute_instance" "ecs-transit-prod-egress" {
  provider = huaweicloud.general_service
  name              = "ecs-transit-egress"
  image_id          = data.huaweicloud_images_image.myimage.id
  flavor_id         = data.huaweicloud_compute_flavors.myflavor.ids[0]
  security_group_ids   = [ huaweicloud_networking_secgroup.sg_general.id ]
  availability_zone = data.huaweicloud_availability_zones.myaz.names[0]
  user_data =         base64encode(file("user_data.sh"))

  network {
    uuid = data.terraform_remote_state.network.outputs.transit_prod_egress_subnet_id
    fixed_ip_v4  = "10.18.0.101"
  }
}
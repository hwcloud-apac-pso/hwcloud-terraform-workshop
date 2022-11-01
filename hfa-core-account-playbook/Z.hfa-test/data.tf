data "terraform_remote_state" "network" {
  backend = "local"

  config = {
    path = "../1.hfa-network-playbook/terraform.tfstate"
  }
}

data "huaweicloud_availability_zones" "availability_zone" {
  provider = huaweicloud.general_service
}

data "huaweicloud_compute_flavors" "compute_flavor" {
  provider = huaweicloud.general_service
  availability_zone = data.huaweicloud_availability_zones.availability_zone.names[0]
  performance_type  = "computingv3"
  cpu_core_count    = 2
  memory_size       = 4
}

data "huaweicloud_images_image" "compute_image" {
  name        = "Ubuntu 20.04 server 64bit"
  most_recent = true
  provider = huaweicloud.general_service
}
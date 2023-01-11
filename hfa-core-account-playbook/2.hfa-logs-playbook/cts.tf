module "general_service_cts" {
  source = "../../terraform-hwcloud-modules/terraform-hwcloud-cts-local" 
  cts_local_rotation_day = var.cts_local_rotation_day
  #cts_switch = false
  providers = {
    huaweicloud = huaweicloud.general_service
  }
}
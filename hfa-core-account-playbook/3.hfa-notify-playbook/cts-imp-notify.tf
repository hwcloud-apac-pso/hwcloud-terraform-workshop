module "general_service_cts_notify" {
  source = "../../terraform-hwcloud-modules/terraform-hwcloud-cts-notification"
  providers = {
    huaweicloud = huaweicloud.general_service
  }
  root_account_name = module.global_variables.general_service_root_account_name  
  cts_important_notify_email = var.cts_notify_email
  cts_important_notify_phone = var.cts_notify_phone
}

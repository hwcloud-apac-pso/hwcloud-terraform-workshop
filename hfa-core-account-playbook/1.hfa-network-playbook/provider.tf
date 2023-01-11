terraform {
  required_providers {
    huaweicloud = {
      source  = "huaweicloud/huaweicloud"
      version = "~> 1.37.1"
    }
  }
}

provider "huaweicloud" {
  # alias not support variable
  alias      = "general_service"
  region     = module.global_variables.default_region
  access_key = module.global_variables.core_account_ak
  secret_key = module.global_variables.core_account_sk
}
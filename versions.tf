terraform {
  required_version = ">= 0.14"
  required_providers {
    ignition = {
      source  = "community-terraform-providers/ignition"
      version = "< 2.0.0"
    }
  }
}

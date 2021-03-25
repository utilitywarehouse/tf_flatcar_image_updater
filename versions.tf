terraform {
  required_version = ">= 0.14"
  required_providers {
    ignition = {
      source  = "terraform-providers/ignition"
      version = ">= 1.2.1"
    }
  }
}

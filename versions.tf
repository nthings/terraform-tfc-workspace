terraform {
  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = ">= 0.31"
    }
  }

  required_version = ">= 1.0.0"
}

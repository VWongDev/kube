terraform {
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~> 4.16"
        }
    }
}

provider "aws" {
    region = "us-east-1"
}

module "bootstrap" {
    source      = "./modules/bootstrap"
    org_name    = var.org_name
    repo_name   = var.repo_name
    environment = var.environment
}
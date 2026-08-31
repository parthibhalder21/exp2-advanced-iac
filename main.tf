terraform {
  required_version = ">= 1.6.0"
  required_providers {
    aws = { source = "hashicorp/aws", version = "~> 5.0" }
  }
}

provider "aws" {
  region = var.region
}

module "network" {
  source     = "./modules/network"
  admin_cidr = var.admin_cidr
}

module "compute" {
  source         = "./modules/compute"
  ami_id         = var.ami_id
  key_name       = var.key_name
  web_count      = var.web_count
  public_subnet  = module.network.public_subnet
  private_subnet = module.network.private_subnet
  web_sg_id      = module.network.web_sg_id
  db_sg_id       = module.network.db_sg_id
}

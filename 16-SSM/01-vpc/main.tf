module "roboshop" {
  source       = "../../14-vpc"
  project_name = var.project_name
  environment  = var.environment
  common_tags  = var.common_tags
  vpc_tags     = var.vpc_tags

  #public subnet
  public_subnets_cidr = var.public_subnets_cidr
  public_subnets_tags = var.public_subnets_tags

  #private subnet
  private_subnets_cidr = var.private_subnets_cidr
  private_subnets_tags = var.private_subnets_tags

  #database subnet
  database_subnets_cidr = var.database_subnets_cidr
  database_subnets_tags = var.database_subnets_tags
}

module "mongodb" {
  source         = "../../14-security-group"
  project_name   = var.project_name
  environment    = var.environment
  vpc_id         = data.aws_ssm_parameter.vpc_id.value
  sg_name        = "MongoDB"
  sg_description = "Desc for MongoDB"
  common_tags    = var.common_tags
  #sg_ingress_rules = var.mongodb_sg_ingress_rules
}

module "catalogue" {
  source         = "../../14-security-group"
  project_name   = var.project_name
  environment    = var.environment
  vpc_id         = data.aws_ssm_parameter.vpc_id.value
  sg_name        = "Catalogue"
  sg_description = "Desc for catalogue"
  common_tags    = var.common_tags
  #sg_ingress_rules = var.mongodb_sg_ingress_rules
}

module "user" {
  source         = "../../14-security-group"
  project_name   = var.project_name
  environment    = var.environment
  vpc_id         = data.aws_ssm_parameter.vpc_id.value
  sg_name        = "User"
  sg_description = "Desc for user"
  common_tags    = var.common_tags
  #sg_ingress_rules = var.mongodb_sg_ingress_rules
}

#mongodb accepting connections from catalogue istance
resource "aws_security_group_rule" "mongodb_catalogue" {
  type                     = "ingress"
  from_port                = 27017
  to_port                  = 27017
  protocol                 = "tcp"
  security_group_id         = module.mongodb.sg_id
  source_security_group_id  = module.catalogue.sg_id
}

resource "aws_security_group_rule" "mongodb_user" {
  type                     = "ingress"
  from_port                = 27017
  to_port                  = 27017
  protocol                 = "tcp"
  security_group_id         = module.mongodb.sg_id
  source_security_group_id  = module.user.sg_id
}

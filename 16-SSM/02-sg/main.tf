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

module "redis" {
  source         = "../../14-security-group"
  project_name   = var.project_name
  environment    = var.environment
  vpc_id         = data.aws_ssm_parameter.vpc_id.value
  sg_name        = "redis"
  sg_description = "Desc for redis"
  common_tags    = var.common_tags
}

module "mysql" {
  source         = "../../14-security-group"
  project_name   = var.project_name
  environment    = var.environment
  vpc_id         = data.aws_ssm_parameter.vpc_id.value
  sg_name        = "mysql"
  sg_description = "Desc for mysql"
  common_tags    = var.common_tags
}

module "rabbitmq" {
  source         = "../../14-security-group"
  project_name   = var.project_name
  environment    = var.environment
  vpc_id         = data.aws_ssm_parameter.vpc_id.value
  sg_name        = "rabbitmq"
  sg_description = "Desc for rabbitmq"
  common_tags    = var.common_tags
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
}

module "cart" {
  source         = "../../14-security-group"
  project_name   = var.project_name
  environment    = var.environment
  vpc_id         = data.aws_ssm_parameter.vpc_id.value
  sg_name        = "cart"
  sg_description = "Desc for cart"
  common_tags    = var.common_tags
}

module "shipping" {
  source         = "../../14-security-group"
  project_name   = var.project_name
  environment    = var.environment
  vpc_id         = data.aws_ssm_parameter.vpc_id.value
  sg_name        = "cashippingrt"
  sg_description = "Desc for cashippingrt"
  common_tags    = var.common_tags
}

module "payment" {
  source         = "../../14-security-group"
  project_name   = var.project_name
  environment    = var.environment
  vpc_id         = data.aws_ssm_parameter.vpc_id.value
  sg_name        = "payment"
  sg_description = "Desc for payment"
  common_tags    = var.common_tags
}

module "ratings" {
  source         = "../../14-security-group"
  project_name   = var.project_name
  environment    = var.environment
  vpc_id         = data.aws_ssm_parameter.vpc_id.value
  sg_name        = "ratings"
  sg_description = "Desc for ratings"
  common_tags    = var.common_tags
}

module "web" {
  source         = "../../14-security-group"
  project_name   = var.project_name
  environment    = var.environment
  vpc_id         = data.aws_ssm_parameter.vpc_id.value
  sg_name        = "web"
  sg_description = "Desc for web"
  common_tags    = var.common_tags
}

#mongodb accepting connections from catalogue istance
resource "aws_security_group_rule" "mongodb_catalogue" {
  type                     = "ingress"
  from_port                = 27017
  to_port                  = 27017
  protocol                 = "tcp"
  security_group_id        = module.mongodb.sg_id
  source_security_group_id = module.catalogue.sg_id
}

resource "aws_security_group_rule" "mongodb_user" {
  type                     = "ingress"
  from_port                = 27017
  to_port                  = 27017
  protocol                 = "tcp"
  security_group_id        = module.mongodb.sg_id
  source_security_group_id = module.user.sg_id
}

resource "aws_security_group_rule" "redis_cart" {
  type                     = "ingress"
  from_port                = 6379
  to_port                  = 6379
  protocol                 = "tcp"
  security_group_id        = module.redis.sg_id
  source_security_group_id = module.cart.sg_id
}

resource "aws_security_group_rule" "redis_user" {
  type                     = "ingress"
  from_port                = 6379
  to_port                  = 6379
  protocol                 = "tcp"
  security_group_id        = module.redis.sg_id
  source_security_group_id = module.user.sg_id
}

resource "aws_security_group_rule" "mysql_shipping" {
  type                     = "ingress"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
  security_group_id        = module.mysql.sg_id
  source_security_group_id = module.shipping.sg_id
}

resource "aws_security_group_rule" "mysql_ratings" {
  type                     = "ingress"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
  security_group_id        = module.mysql.sg_id
  source_security_group_id = module.ratings.sg_id
}

resource "aws_security_group_rule" "rabbitmq_payments" {
  type                     = "ingress"
  from_port                = 5672
  to_port                  = 5672
  protocol                 = "tcp"
  security_group_id        = module.rabbitmq.sg_id
  source_security_group_id = module.payment.sg_id
}
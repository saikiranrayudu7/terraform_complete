variable "sg_name" {

}

variable "sg_description" {
  default = ""
  type = string
}

variable "sg_tags" {
  default = {}
  type = map
}

variable "vpc_id" {
  
}

variable "common_tags" {
  
}

variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "sg_ingress_rules" {
  type = list
  default = []
}
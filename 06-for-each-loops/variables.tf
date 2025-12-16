variable "ami_id" {
  type    = string
  default = "ami-068c0051b15cdb816"
}

variable "instance_names" {
  type = map
  default = {
    mongodb = "t2.micro"
    linux   = "t2.small"
    mysql   = "t3.medium"
  }
}

variable "ami_id" {
  type    = string
  default = "ami-068c0051b15cdb816"
}

variable "instance_type" {
  default = {
    dev  = "t2.micro"
    prod = "t3.small"
  }
}

variable "tags" {
  type = map(any)
  default = {
    Name        = "Learning Variables"
    project     = "Learning"
    Environment = "DEV"
    Component   = "WEB"
    Terraform   = "True"
  }
}
variable "ami_id" {
  type    = string
  default = "ami-068c0051b15cdb816"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
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

variable "sg-name" {
  type    = string
  default = "roboshop-all"
}

variable "sg-description" {
  type    = string
  default = "Allowing all ports"
}

variable "inbound-from-port" {
  type    = number
  default = 0
}

variable "cidr-blocks" {
  type    = list(any)
  default = ["0.0.0.0/0"]
}

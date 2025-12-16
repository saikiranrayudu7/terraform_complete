variable "instance_type" {
    type = string
    default = "t2.micro"
}

variable "instance_names" {
  type = list
  default = ["mongodb","redis","mysql"]
}

variable "ami_id" {
  type    = string
  default = "ami-068c0051b15cdb816"
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

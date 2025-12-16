variable "sg-name" {
  type    = string
  default = "roboshop-all-aws"
}

variable "sg-description" {
    type = string
    default = "Allow TLS inbound traffic and all outbound traffic"
}

variable "inbound-from_port" {
  default = 0
}
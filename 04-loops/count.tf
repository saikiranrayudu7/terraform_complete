resource "aws_instance" "count" {
  count         = length(var.instance_names)
  ami           = var.ami_id
  instance_type = var.instance_names == "Mongodb" ? "t2.small" : var.instance_type

  tags = {
    Name: var.instance_names[count.index]
  }
}

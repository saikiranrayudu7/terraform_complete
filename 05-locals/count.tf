resource "aws_instance" "count" {
  count         = length(var.instance_names)
  ami           = var.ami_id
  instance_type = local.instance_type

  tags = {
    Name: var.instance_names[count.index]
  }
}

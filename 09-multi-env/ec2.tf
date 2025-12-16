resource "aws_instance" "multi-env" {
  for_each      = var.instance_names
  ami           = var.ami_id
  instance_type = each.value
  key_name      = "ansible"

  tags = {
    Name = each.key
  }
}

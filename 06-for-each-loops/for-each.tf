resource "aws_instance" "for-each" {
  for_each               = var.instance_names
  ami                    = var.ami_id
  instance_type          = each.value
  key_name               = "ansible"
  vpc_security_group_ids = ["default"]

  tags = {
    Name = each.key
  }
}

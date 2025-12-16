resource "aws_instance" "learning-variables" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.learning-variables.id]

  tags = var.tags
}

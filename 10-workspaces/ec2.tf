resource "aws_instance" "workspaces" {
  ami           = var.ami_id
  instance_type = lookup(var.instance_type, terraform.workspace)

  tags = {
    Name      = "Workspaces"
    Workspace = terraform.workspace
  }
}

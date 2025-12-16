resource "aws_instance" "provisioners-localexec" {
  ami           = var.ami_id
  instance_type = "t2.micro"

  tags = {
    Name = "Provisioners local-exec"
  }

  provisioner "local-exec" {
    command = "echo hello ${self.public_ip}"
  }

  provisioner "local-exec" {
    command = "echo This will work when we create"
    when    = create
  }

  provisioner "local-exec" {
    command = "echo This will work when we destroy"
    when    = destroy
  }
}

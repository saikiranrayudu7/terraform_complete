resource "aws_instance" "provisioners_remote_exec" {
  ami           = var.ami_id
  instance_type = "t2.micro"
  key_name      = "ansible"

  tags = {
    Name = "Provisioners local-exec"
  }

  # ---------- LOCAL EXEC (CREATE) ----------
  provisioner "local-exec" {
    command = "echo hello ${self.public_ip}"
  }

  provisioner "local-exec" {
    command = "echo This will work when we create"
    when    = create
  }

  # ---------- CONNECTION ----------
  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("ansible.pem")
    host        = self.public_ip
    timeout     = "5m"
  }

  # ---------- REMOTE EXEC ----------
  provisioner "remote-exec" {
    inline = [
      "echo 'this is from remote exec' > /tmp/remote.txt",
      "sudo dnf install nginx -y",
      "sudo systemctl start nginx"
    ]
  }

  # ---------- LOCAL EXEC (DESTROY) ----------
  provisioner "local-exec" {
    command = "echo This will work when we destroy"
    when    = destroy
  }
}

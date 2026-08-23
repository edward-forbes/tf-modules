resource "aws_instance" "web" {
  count = 2

  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [var.public_security_group_id]
  subnet_id              = var.public_subnet_ids[count.index]

  tags = {
    Name = "${var.project}-EC2-Web-${count.index + 1}"
  }
}
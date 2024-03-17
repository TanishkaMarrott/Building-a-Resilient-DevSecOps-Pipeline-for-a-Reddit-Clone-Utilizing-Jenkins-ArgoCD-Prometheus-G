
resource "aws_instance" "web" {
  ami                    = "ami-00247e9dc9591c233"   # Updated AMI ID for ap-northeast-1
  instance_type          = "t2.large"
  key_name               = "key"
  vpc_security_group_ids = [aws_security_group.Jenkins-sg.id]
  user_data              = templatefile("./install.sh", {})

  tags = {
    Name = "Jenkins-sonarqube-trivy-vm"
  }

  root_block_device {
    volume_size = 30
  }
}

resource "aws_security_group" "Jenkins-sg" {
  name        = "Jenkins-sg"
  description = "Allow specific inbound traffic"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["your-ip-address/32"] #Will replace ID
  }

  dynamic "ingress" {
    for_each = [80, 443, 8080, 9000, 3000]
    content {
      description      = "inbound rules for ${ingress.value}"
      from_port        = ingress.value
      to_port          = ingress.value
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "jenkins-sg"
  }
}

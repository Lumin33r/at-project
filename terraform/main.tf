resource "aws_instance" "troy-project14" {
  ami           = "ami-0d191299f2822b1fa" # Amazon Linux 2 AMI ID (please verify and use the correct ID for your region)
  instance_type = "t2.micro"
  #key_name      = "troyKeyPair-east-us-1"
  key_name      = var.key_name
  tags = {
    Name = "troy-project14"
  }
  vpc_security_group_ids = [aws_security_group.troy-sg-project14.id]
}

resource "aws_security_group" "troy-sg-project14" {
  name        = "troy-sg-project14"
  description = "Allow SSH and MySQL inbound traffic"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "MySQL"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


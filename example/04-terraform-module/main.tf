

# Subnet
data "aws_subnet" "public" {
  id = var.subnet_id
}

data "aws_ami" "demo" {
  most_recent = true
  filter {
    name   = "name"
    values = [var.ami_name]
  }
  owners = ["self"]
}

resource "aws_security_group" "allow_http_8000" {
  name        = "allow_http_8000"
  description = "Allow HTTP on 8000 inbound traffic"

  ingress {
    description = "HTTP on 8000 from everywhere"
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_http_8000"
  }
}

resource "aws_instance" "demo" {
  ami           = data.aws_ami.demo.id
  instance_type = "t2.micro"

  security_groups = [aws_security_group.allow_http_8000.name]

  tags = {
    Name = var.instance_name
  }

}

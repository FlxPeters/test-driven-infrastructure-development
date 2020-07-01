
# for testing only
provider "aws" {
  region = "eu-west-1"
}

# Subnet
data "aws_subnet" "public" {
    id = var.subnet_id
}

# Create Security group
resource "aws_security_group" "public_http" {
  
  name        = "public-http"
  description = "Allow HTTP inbound traffic"
  
  vpc_id = "${data.aws_subnet.public.vpc_id}"

  ingress {
    cidr_blocks = ["${data.aws_subnet.public.cidr_block}"]
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
  }
}

# Creaste ALB
# resource "aws_lb" "this" {
#   name               = "tdd-infra-example-lb"
#   internal           = false
#   load_balancer_type = "application"
#   security_groups    = ["${aws_security_group.lb_sg.id}"]
#   subnets            = ["${aws_subnet.public.*.id}"]

#   enable_deletion_protection = true

#   access_logs {
#     bucket  = "${aws_s3_bucket.lb_logs.bucket}"
#     prefix  = "test-lb"
#     enabled = true
#   }

#   tags = {
#     Environment = "production"
#   }
# }


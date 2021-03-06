# for testing only
provider "aws" {
  region = "eu-west-1"
}

variable "subnet_id" {
  default = "subnet-0e7b00a4dbc07bb64"
}
variable "ami_name" {
  default = "packer-tdd-infra-example-latest"
}
variable "instance_name" {
  default = "packer-tdd-infra-example"
}


module "test" {
  source = "../"

  subnet_id     = var.subnet_id
  ami_name      = var.ami_name
  instance_name = var.instance_name

}


output "instance_id" {
    value = module.test.instance_id
}
output "instance_public_ip" {
    value = module.test.instance_public_ip
}
output "security_group_id" {
    value = module.test.security_group_id
}
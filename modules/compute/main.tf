variable "ami_id" {
  type = string
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "web_count" {
  type    = number
  default = 2
}

variable "key_name" {
  type = string
}

variable "public_subnet" {
  type = string
}

variable "private_subnet" {
  type = string
}

variable "web_sg_id" {
  type = string
}

variable "db_sg_id" {
  type = string
}

resource "aws_instance" "web" {
  count                  = var.web_count
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.public_subnet
  vpc_security_group_ids = [var.web_sg_id]
  key_name               = var.key_name
  tags                   = { Name = "web-${count.index + 1}", Tier = "web" }
}

resource "aws_instance" "db" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.private_subnet
  vpc_security_group_ids = [var.db_sg_id]
  tags                   = { Name = "database", Tier = "db" }
}

output "web_public_ips" {
  value = aws_instance.web[*].public_ip
}

output "web_ids" {
  value = aws_instance.web[*].id
}

output "db_private_ip" {
  value = aws_instance.db.private_ip
}

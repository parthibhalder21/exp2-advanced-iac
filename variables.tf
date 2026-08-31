variable "region" {
  type    = string
  default = "us-east-1"
}

variable "ami_id" {
  type    = string
  default = "ami-06e78a71af43ef21a"
}

variable "key_name" {
  type    = string
  default = "lab-key"
}

variable "web_count" {
  type    = number
  default = 2
}

variable "admin_cidr" {
  type    = string
  default = "0.0.0.0/0"
}

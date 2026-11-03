variable "aws_region" {
  type = string
  description = "deploy region"
  default = "ap-south-1"
}
variable "cidr_block_vpc" {
  type = string
  description = "vpc cidr block"
}
variable "cidr_block_subnet" {
  type = string
  description = "subnet cidr block"
}

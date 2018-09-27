variable "cidr_prefix"{
  type = "string"
  description = "The first 16 bit prefix for a cidr block. For eg> if the CIDR block needs to be 172.16.0.0/16. Enter 172.16"
}

variable "vpc_name"{
  type = "string"
  description = "Enter the name of vpc to be created"
}

variable "aws_region"{
  type = "string"
  default = "us-east-2"
}

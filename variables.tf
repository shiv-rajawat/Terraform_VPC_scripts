##### This file contains variables that are used in the main.tf file.
##### Remove or comment the default field of the variable to input custom values at the time of running the script.


##### Initial two bytes of VPC CIDR block

variable "cidr_prefix"{
  type = "string"
  description = "The first 16 bit prefix for a cidr block. For example, if the CIDR block needs to be 172.16.0.0/16. Enter 172.16"
  default = "172.16"
}


##### VPC name

variable "vpc_name"{
  type = "string"
  description = "Enter the name of vpc to be created"
  default = "my_vpc"
}


#### AWS region

variable "aws_region"{
  description = "The region in which you want to create resources. eg: us-east-1"
  type = "string"
  default = "us-east-2"
}


##### Virtual Private gateway name

variable "vpgw_name"{
  type = "string"
  default = "gateway-of-india"
}

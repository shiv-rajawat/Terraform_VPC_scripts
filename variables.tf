##### This file contains variables that are used in the main.tf file.
##### Remove or comment the default field of the variable to input custom values at the time of running the script.


##### Initial two bytes of VPC CIDR block

variable "cidr_prefix"{
  type = "string"
  description = "The first 16 bit prefix for a cidr block. For example, if the CIDR block needs to be 172.16.0.0/16. Enter 172.16"
  default = "172.16"
}

##### Initial two bytes of VPC CIDR block of second VPC

variable "cidr_prefix_second"{
  type = "string"
  description = "The first 16 bit prefix for a cidr block. For example, if the CIDR block needs to be 10.0.0.0/16. Enter 10.0"
  default = "10.0"
}



##### VPC name

variable "vpc_name"{
  type = "string"
  description = "Enter the name of vpc to be created"
  default = "my-vpc"
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


##### Account Id can be found in "Your Security Credentials".

variable "owner_account_id" {
  description = "AWS owner account ID"
  ##### default     = "7377####0##8"
}


##### Change it to false if need to manually accept the peering request.

variable "auto_accept_peering" {
  description = "Auto accept peering connection"
  default     = true
}


##### Change the value to 0 to not disable peering.

variable "create_peering" {
  description = "Create peering connection, 0 to not create"
  default = 1
}

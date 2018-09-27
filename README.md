# Terraform_VPC_scripts

This repo contains terraform scripts to create a VPC and 6 subnets inside it distributed equally among 2 availability zones.
In addition, it also creates another VPC and enables peering between the two VPCs.

Change the default values in variables.tf file as per your requirements. All the variables except Account Id have been hard coded as the
default value of variables. 

Clone this repo and open cmd from the main folder. Enter "terraform apply". Provide your Account Id and the creation will kickstart.

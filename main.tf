###################################
# @uthor: Shiv Mangal Singh Rajawat
###################################

#####Configuring the provider as AWS.

provider "aws" {
  region = "${var.aws_region}"
}

##### Creating a VPC in user specified region.

resource "aws_vpc" "main" {
  cidr_block           = "${var.cidr_prefix}.0.0/16"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"

  tags {
    Name = "${var.vpc_name}"
  }
}

##### Creating 6 subnets of which 3 are in AZ - "a" and 3 in AZ - "b".

resource "aws_subnet" "priv_a1" {
  vpc_id            = "${aws_vpc.main.id}"
  cidr_block        = "${var.cidr_prefix}.0.0/24"
  availability_zone = "${var.aws_region}a"

  tags {
    Name = "${var.vpc_name}-priv-a1"
  }
}
resource "aws_subnet" "priv_a2" {
  vpc_id            = "${aws_vpc.main.id}"
  cidr_block        = "${var.cidr_prefix}.1.0/24"
  availability_zone = "${var.aws_region}a"

  tags {
    Name = "${var.vpc_name}-priv-a2"
  }
}

resource "aws_subnet" "priv_a3" {
  vpc_id            = "${aws_vpc.main.id}"
  cidr_block        = "${var.cidr_prefix}.2.0/24"
  availability_zone = "${var.aws_region}a"

  tags {
    Name = "${var.vpc_name}-priv-a3"
  }
}

resource "aws_subnet" "priv_b1" {
  vpc_id            = "${aws_vpc.main.id}"
  cidr_block        = "${var.cidr_prefix}.3.0/24"
  availability_zone = "${var.aws_region}b"

  tags {
    Name = "${var.vpc_name}-priv-b1"
  }
}

resource "aws_subnet" "priv_b2" {
  vpc_id            = "${aws_vpc.main.id}"
  cidr_block        = "${var.cidr_prefix}.4.0/24"
  availability_zone = "${var.aws_region}b"

  tags {
    Name = "${var.vpc_name}-priv-b2"
  }
}
resource "aws_subnet" "priv_b3" {
  vpc_id            = "${aws_vpc.main.id}"
  cidr_block        = "${var.cidr_prefix}.5.0/24"
  availability_zone = "${var.aws_region}b"

  tags {
    Name = "${var.vpc_name}-priv-b3"
  }
}

##### Creating a virtual private gateway and attaching it to the created VPC.

resource "aws_vpn_gateway" "vpn_gw" {
  vpc_id = "${aws_vpc.main.id}"

  tags {
    Name = "gateway-of-india"
  }
}


##### Creating another VPC for VPC peering.

resource "aws_vpc" "second_vpc" {
  cidr_block           = "${var.cidr_prefix_second}.0.0/16"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"

  tags {
    Name = "${var.vpc_name}-second"
  }
}

##########################
# VPC peering connection #
##########################
resource "aws_vpc_peering_connection" "this" {
  count = "${var.create_peering ? 1 : 0}"
  peer_owner_id = "${var.owner_account_id}"
  peer_vpc_id   = "${aws_vpc.main.id}"
  vpc_id        = "${aws_vpc.second_vpc.id}"
  auto_accept   = "${var.auto_accept_peering}"
}


##### Printing the peering connection Id.

output "vpc_peering_id" {
  description = "Peering connection ID"
  value       = "${element(concat(aws_vpc_peering_connection.this.*.id, list("")),0)}"
}

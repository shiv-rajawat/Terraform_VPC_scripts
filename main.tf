###################################
# @uthor: Shiv Mangal Singh Rajawat
###################################

#####Configuring the provider as AWS

provider "aws" {
  region = "${var.aws_region}"
}

##### Creating a VPC in user specified region

resource "aws_vpc" "main" {
  cidr_block           = "${var.cidr_prefix}.0.0/16"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"

  tags {
    Name = "${var.vpc_name}-vpc"
  }
}

##### Creating 6 subnets of which 3 are in AZ - ""
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

resource "aws_vpn_gateway" "vpn_gw" {
  vpc_id = "${aws_vpc.main.id}"

  tags {
    Name = "gateway-of-india"
  }
}

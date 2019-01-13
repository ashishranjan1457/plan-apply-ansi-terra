provider "aws" {
	access_key = "${var.aws_access_key}"
	secret_key = "${var.aws_secret_key}"
  region     = "${var.aws_region}"
}

# Data
data "aws_vpc" "default" {}
data "aws_availability_zones" "available" {}
//data "aws_subnet_ids" "all" {
//vpc_id = "${data.aws_vpc.default.id}"
//}

resource "aws_security_group" "mysql_secgroup" {
	vpc_id = "${data.aws_vpc.default.id}"

	ingress {
		from_port = "${var.mysql_port}"
		to_port = "${var.mysql_port}"
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}
}

provider "aws" {
    region = "us-west-2"
    version = "~> 1.17"
}

data "aws_ami" "fuzzify"{
    most_recent = true

    filter {
        name = "name"
        values = ["fuzzify-*"]
    }

    owners = ["034445236329"]
}
resource "aws_instance" "fuzzify-single" {
    ami = "${data.aws_ami.fuzzify.id}"
    instance_type = "c5.2xlarge"
    vpc_security_group_ids = ["sg-84c0bfe1"]
    key_name = "laptop-ubu"
    associate_public_ip_address = true
}
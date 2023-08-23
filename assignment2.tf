provider "aws" {
    region = "us-east-1"
    access_key = "############"
    secret_key = "############"
}

resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16
    tags
}
resource "aws_instance" "demo1" {

    ami = "ami-085925f297f89fce1"
    instace_type = "t2.micro"

}


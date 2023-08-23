provider "aws" {
    region = "us-east-1"
    access_key = "############"
    secret_key = "############"
}

resource "aws_vpc" "main" {

    cidr_block = "10.0.0.0/16"

}


resource "aws_subnet" "subnet1" {

    vpc_id = aws.vpc.main.id
    cidr_block = "10.0.0.0/24"


}

resource "aws_subnet" "subnet2" {

    vpc_id = aws.vpc.main.id
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = true

}

resource "aws_security_group" "demo_group"{

    name = "demo_group"
    description = "defining SHH ports for inbound and outbound traffic"    

    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}


resource "aws_instance" "demo1" {
    ami = "ami-085925f297f89fce1"
    instace_type = "t2.micro"
    subnet_id     = aws_subnet.public_subnet.id

    security_groups = [aws_security_group.demo_group.name]

    root_block_device {
        volume_type = "gp2"
        volume_size = 5
        encrypted = false 
    }

    tags = {
        purpose = "Assignment"
    }
}


























































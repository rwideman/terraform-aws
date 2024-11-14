resource "aws_vpc" "myvpc" {
    cidr_block = "192.168.0.0/24"
    instance_tenancy = "default"
    enable_dns_hostnames = "true"

    tags = {
        Name = "myvpc"
    }
}

resource "aws_security_group" "cluster-ig" {
    name = "cluster-ig"
    description = "This firewall allows SSH, HTTP and MYSQL"
    vpc_id = "${aws_vpc.myvpc.id}"

    ingress {
        description = "SSH"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress { 
        description = "HTTP"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "TCP"
        from_port = 3306
        to_port = 3306
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "cluster-ig"
    }
}

resource "aws_subnet" "public" {
    vpc_id = "${aws_vpc.myvpc.id}"
    cidr_block = "192.168.0.0/24"
    availability_zone = "us-east-1a"
    map_public_ip_on_launch = "true"

    tags = {
        Name = "my_public_subnet"
    } 
}

resource "aws_internet_gateway" "igw" {
    vpc_id = "${aws_vpc.myvpc.id}"

    tags = { 
        Name = "igw"
    }
}

resource "aws_route_table" "rt" {
    vpc_id = "${aws_vpc.myvpc.id}"

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.igw.id}"
    }

    tags = {
        Name = "rt"
    }
}

resource "aws_route_table_association" "a" {
    subnet_id = "${aws_subnet.public.id}"
    route_table_id = "${aws_route_table.rt.id}"
}

resource "aws_route_table_association" "b" {
    subnet_id = "${aws_subnet.public.id}"
    route_table_id = "${aws_route_table.rt.id}"
}
data "aws_ami" "debian-ami" {
    most_recent = true
    owners      = ["amazon"]

    filter {
        name   = "name"
        values = ["debian-12-amd64*"]
    }
}

resource "aws_instance" "master" {
    ami = ami-064519b8c76274859 # Debian 12 amd64
    #ami = ami-0789039e34e739d67 # Debian 12 arm64
    instance_type = "t3a.medium"
    key_name = "${aws_key_pair.generated_key.key_name}"
    vpc_security_group_ids = [ "${aws_security_group.cluster-ig.id}" ]
    subnet_id = "${aws_subnet.public.id}"

    root_block_device {
        volume_size = 30
        volume_type = "gp3"
    }
    
    tags = {
        Name = "master"
    }
}

# resource "aws_instance" "worker1" {
#     ami = "ami-03e383d33727f4804"
#     instance_type = "t3a.medium"
#     key_name = "${aws_key_pair.generated_key.key_name}"
#     vpc_security_group_ids = [ "${aws_security_group.cluster-ig.id}" ]
#     subnet_id = "${aws_subnet.public.id}"

#     tags = {
#         Name = "worker1"
#     }
# }

# resource "aws_instance" "worker2" {
#     ami = "ami-03e383d33727f4804"
#     instance_type = "t3a.medium"
#     key_name = "${aws_key_pair.generated_key.key_name}"
#     vpc_security_group_ids = [ "${aws_security_group.cluster-ig.id}" ]
#     subnet_id = "${aws_subnet.public.id}"

#     tags = {
#         Name = "worker2"
#     }
# }

output "master_public_dns" {
    description = "Master Public DNS"
    value = aws_instance.master.public_dns
}

output "master_instance_id" {
    description = "Master Instance ID"
    value = aws_instance.master.id
}

# output "worker1_public_dns" {
#     description = "Worker1 Public DNS"
#     value = aws_instance.worker1.public_dns
# }

# output "worker1_instance_id" {
#     description = "Worker1 Instance ID"
#     value = aws_instance.worker1.id
# }

# output "worker2_public_dns" {
#     description = "Worker2 Public DNS"
#     value = aws_instance.worker2.public_dns
# }

# output "worker2_instance_id" {
#     description = "Worker2 Instance ID"
#     value = aws_instance.worker2.id
# }
resource "aws_instance" "node1" {
    ami = data.aws_ami.debian12.id
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

resource "aws_instance" "node2" {
    ami = data.aws_ami.debian12.id
    instance_type = "t3a.medium"
    key_name = "${aws_key_pair.generated_key.key_name}"
    vpc_security_group_ids = [ "${aws_security_group.cluster-ig.id}" ]
    subnet_id = "${aws_subnet.public.id}"

    tags = {
        Name = "worker1"
    }
}

resource "aws_instance" "node3" {
    ami = data.aws_ami.debian12.id
    instance_type = "t3a.medium"
    key_name = "${aws_key_pair.generated_key.key_name}"
    vpc_security_group_ids = [ "${aws_security_group.cluster-ig.id}" ]
    subnet_id = "${aws_subnet.public.id}"

    tags = {
        Name = "worker2"
    }
}
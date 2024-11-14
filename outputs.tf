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
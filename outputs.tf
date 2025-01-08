output "node1_public_dns" {
  description = "Node1 Public DNS"
  value       = aws_instance.node1.public_dns
}

output "node1_instance_id" {
  description = "Node1 Instance ID"
  value       = aws_instance.node1.id
}

# output "node2_public_dns" {
#     description = "Node2 Public DNS"
#     value = aws_instance.node2.public_dns
# }

# output "node2_instance_id" {
#     description = "Node2 Instance ID"
#     value = aws_instance.node2.id
# }

# output "node3_public_dns" {
#     description = "Node3 Public DNS"
#     value = aws_instance.node3.public_dns
# }

# output "node3_instance_id" {
#     description = "Node3 Instance ID"
#     value = aws_instance.node3.id
# }
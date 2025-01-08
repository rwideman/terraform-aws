resource "tls_private_key" "ec2-key" {
  algorithm = "RSA"
}

resource "aws_key_pair" "generated_key" {
  key_name   = "ec2-key"
  public_key = tls_private_key.ec2-key.public_key_openssh
  depends_on = [
    tls_private_key.ec2-key
  ]
}

resource "local_file" "key" {
  content         = tls_private_key.ec2-key.private_key_pem
  filename        = "ec2-key.pem"
  file_permission = "0400"
  depends_on = [
    tls_private_key.ec2-key
  ]
}
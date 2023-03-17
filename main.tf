resource "tls_private_key" "ssh_private_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
resource "aws_key_pair" "ssh_key" {
  key_name   = var.pem_key_name
  public_key = tls_private_key.ssh_private_key.public_key_openssh
  provisioner "local-exec" { # This will create the pem where the terraform will run!!
    command = "rm -f ./${var.pem_key_name}.pem && echo '${tls_private_key.ssh_private_key.private_key_pem}' > ./${var.pem_key_name}.pem && chmod 400 ${var.pem_key_name}.pem"
  }
}
data "template_file" "userdata" {
  template = file("${path.module}/elasticsearch.sh")
}
resource "aws_instance" "elasticsearch" {
  ami = "ami-0b5eea76982371e91"
  instance_type = var.instance_type_elasticsearch
  user_data = data.template_file.userdata.rendered
  key_name = var.pem_key_name
  subnet_id = var.subnet_id
  disable_api_termination = true
  iam_instance_profile = aws_iam_instance_profile.ssm_access_instance_profile.name
  vpc_security_group_ids = [aws_security_group.elasticsearch_sg.id]
  # associate_public_ip_address = true
  ebs_block_device {
    device_name = "/dev/xvda"
    volume_size = var.volume_size_elasticsearch
  }
  depends_on = [
    aws_key_pair.ssh_key
  ]
  tags = {
    Name = "nw-social-elasticsearch"
  }
}
resource "aws_security_group" "elasticsearch_sg" {
  name = "nw-social-elasticsearch-sg"
  vpc_id =  var.vpc_id
  ingress {
    description = "ingress rules"
    cidr_blocks = [var.vpc_cidr_block]
    from_port = 22
    protocol = "tcp"
    to_port = 22
  }
  ingress {
    description = "ingress rules"
    cidr_blocks = [var.vpc_cidr_block,"182.71.160.184/29","61.12.91.216/29"]
    from_port = 9300
    protocol = "tcp"
    to_port = 9300
  }
  ingress {
    description = "ingress rules"
    cidr_blocks = [var.vpc_cidr_block,"182.71.160.184/29","61.12.91.216/29"]
    from_port = 9200
    protocol = "tcp"
    to_port = 9200
  }
  egress {
    description = "egress rules"
    cidr_blocks = [ "0.0.0.0/0" ]
    from_port = 0
    protocol = "-1"
    to_port = 0
  }
  tags = {
    Name = "nw-social-elasticsearch-sg"
  }
}
resource "aws_iam_role" "ssm_access" {
  name = "elasticsearch-ssm-access-role-${var.environment}"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
    {
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }
   ]
  })
}
resource "aws_iam_role_policy_attachment" "ssm_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMFullAccess"
  role = aws_iam_role.ssm_access.name
}
resource "aws_iam_role_policy_attachment" "cw_agent_policy" {
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
  role = aws_iam_role.ssm_access.name
}
resource "aws_iam_instance_profile" "ssm_access_instance_profile" {
  name = "monitoring-ssm-access-instance-profile-${var.environment}"
  role = aws_iam_role.ssm_access.name
}
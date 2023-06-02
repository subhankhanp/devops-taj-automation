
resource "aws_instance" "rorserver" {
  ami           = "ami-002843b0a9e09324a"  # Replace with your desired AMI ID
  instance_type = "m6g.xlarge"      # Replace with your desired instance type
  key_name      = "staging-qa"   # Replace with your desired key pair name

  vpc_security_group_ids = ["sg-037cf4fdd30490855"]  # Replace with your existing security group ID

  subnet_id = "subnet-0ce48254dbc1a24fe"  # Replace with your existing subnet ID

  root_block_device {
    volume_type           = "gp2"
    volume_size           = 50  # Replace with your desired volume size in GB
    delete_on_termination = true
}
  # Optional: Customize the instance tags
  tags = {
    Environment = "staging"
    Name = "${var.name}-taj"
  }
}

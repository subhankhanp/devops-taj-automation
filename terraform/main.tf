
resource "aws_instance" "rorserver" {
  ami           = "ami-01d87e25d3c65ec37"  # Replace with your desired AMI ID
  instance_type = "m6g.xlarge"      # Replace with your desired instance type
  key_name      = "staging-qa"   # Replace with your desired key pair name
  iam_instance_profile = "ec2-ssm"

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


resource "aws_lb_target_group_attachment" "rortg" {
  target_group_arn = "arn:aws:elasticloadbalancing:ap-southeast-1:992805018141:targetgroup/gds-ind-qa1/942b294902806219"
  target_id        = aws_instance.rorserver.id
  port             = 80
}

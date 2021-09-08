locals {
  settings = yamldecode(file("values.yaml"))
}
module "data_ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"
  name = local.settings.data.name
  ami                    = local.settings.data.imageid
  instance_type          = local.settings.data.instancetype
  key_name               = local.settings.data.keypair
  monitoring             = true
  vpc_security_group_ids = [local.settings.data.securitygroupid]
  root_block_device = [{
           delete_on_termination = "true"
		   device_name           = "/dev/sda1"
           encrypted             = "true"
           volume_size           = "100"
  }]
  ebs_block_device = [{
           delete_on_termination = "true"
		   device_name           = "/dev/xvdf"
           encrypted             = "true"
           volume_size           = "100"
  }]
  subnet_id              = local.settings.data.subnetid
  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
module "app_ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"
  name = local.settings.app.name
  ami                    = local.settings.app.imageid
  instance_type          = local.settings.app.instancetype
  key_name               = local.settings.app.keypair
  monitoring             = true
  vpc_security_group_ids = [local.settings.app.securitygroupid]
  root_block_device = [{
           delete_on_termination = "true"
		   device_name           = "/dev/sda1"
           encrypted             = "true"
           volume_size           = "100"
  }]
  ebs_block_device = [{
           delete_on_termination = "true"
		   device_name           = "/dev/xvdf"
           encrypted             = "true"
           volume_size           = "100"
  }]
  subnet_id              = local.settings.app.subnetid
  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
module "web_ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"
  name = local.settings.web.name
  ami                    = local.settings.web.imageid
  instance_type          = local.settings.web.instancetype
  key_name               = local.settings.web.keypair
  monitoring             = true
  vpc_security_group_ids = [local.settings.web.securitygroupid]
  root_block_device = [{
           delete_on_termination = "true"
		   device_name           = "/dev/sda1"
           encrypted             = "true"
           volume_size           = "100"
  }] 
  ebs_block_device = [{
           delete_on_termination = "true"
		   device_name           = "/dev/xvdf"
           encrypted             = "true"
           volume_size           = "100"
  }]
  subnet_id              = local.settings.web.subnetid
  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
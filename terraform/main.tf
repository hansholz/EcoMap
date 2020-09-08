#------------------------------------------------
# Region
#------------------------------------------------

provider "aws" {
  access_key = "var_access"
  secret_key = "var_secret"
  region     = var.aws_region
}

#------------------------------------------------
# Remote state
#------------------------------------------------

terraform {
  backend "s3" {
    access_key = "var_access"
    secret_key = "var_secret"
    bucket     = "ecomap.tfstate"
    key        = "terraform.tfstate"
    region     = "eu-central-1"
  }
}

#------------------------------------------------
# EB
#------------------------------------------------

resource "aws_elastic_beanstalk_application" "ecomap_app" {
  name = var.app_name
  tags = {
    "ita_group" = "Lv-517"
    "Owner"     = "I_Humeniuk"
  }
}

resource "aws_elastic_beanstalk_environment" "ecomap_env" {
  name                = "ecomap-env"
  application         = aws_elastic_beanstalk_application.ecomap_app.name
  solution_stack_name = var.solution_stack_name

  setting {
    namespace = "aws:ec2:vpc"
    name      = "VPCId"
    value     = var.vpc_id
  }
  setting {
    namespace = "aws:ec2:vpc"
    name      = "Subnets"
    value     = var.subnet_id
  }
  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MaxSize"
    value     = "1"
  }
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "SecurityGroups"
    value     = var.security_group
  }
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "EC2KeyName"
    value     = var.key_acc
  }
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "InstanceType"
    value     = var.instance_type
  }
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "ImageId"
    value     = var.ami
  }
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = "aws-elasticbeanstalk-ec2-role"
  }
  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "EnvironmentType"
    value     = "SingleInstance"
  }
  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "ServiceRole"
    value     = "aws-elasticbeanstalk-service-role"
  }
  tags = {
    "ita_group" = "Lv-517"
    "Owner"     = "I_Humeniuk"
  }
  provisioner "local-exec" {
    command = "export APP_NAME=${aws_elastic_beanstalk_application.ecomap_app.name}"
  }
  provisioner "local-exec" {
    command = "export ENVIROMENT_NAME=${aws_elastic_beanstalk_environment.ecomap_env.name}"
  }
}


#------------------------------------------------
# Region
#------------------------------------------------

provider "aws" {
  access_key = "var_access"
  secret_key = "var_secret"
  region     = "eu-central-1"
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
  name = "ecomap"
  tags = {
    "ita_group" = "Lv-517"
    "Owner"     = "I_Humeniuk"
  }
}

resource "aws_elastic_beanstalk_environment" "ecomap_env" {
  name                = "ecomap-env"
  application         = aws_elastic_beanstalk_application.ecomap_app.name
  solution_stack_name = "64bit Amazon Linux 2 v3.1.1 running Docker"

  setting {
    namespace = "aws:ec2:vpc"
    name      = "VPCId"
    value     = "vpc-04a5fcbc2d9d97383"
  }
  setting {
    namespace = "aws:ec2:vpc"
    name      = "Subnets"
    value     = "subnet-027514327610029b3"
  }
  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MaxSize"
    value     = "1"
  }
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "SecurityGroups"
    value     = "sg-0afde2e372987b341"
  }
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "EC2KeyName"
    value     = "I_hum_key"
  }
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "InstanceType"
    value     = "t2.medium"
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


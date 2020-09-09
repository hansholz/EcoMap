variable "aws_region" {
  description = "Region for the Instance"
  default     = "eu-central-1"
}
variable "ami" {
  description = "OS identifier"
  default     = "ami-0aad2a7b8483ab367"
}

variable "instance_type" {
  description = "Type of nessesary instance"
  default     = "t2.medium"
}

variable "security_group" {
  description = "Security group"
  default     = "sg-0afde2e372987b341"
}

variable "subnet_id" {
  description = "Nessesary subnet id"
  default     = "subnet-027514327610029b3"
}

variable "vpc_id" {
  description = "Nessesary vpc id"
  default     = "vpc-04a5fcbc2d9d97383"
}

variable "key_acc" {
  description = "key access"
  default     = "I_hum_key"
}

variable "solution_stack_name" {
  default = "64bit Amazon Linux 2 v3.1.1 running Docker"
}

variable "app_name" {
  default = "ecomap"
}

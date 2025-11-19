variable "region" {
  description = "AWS region"
  default     = "ap-south-1"
}

variable "ami" {
  description = "AMI ID for the EC2 instance"
}

variable "instance_type" {
  description = "EC2 instance type"
}

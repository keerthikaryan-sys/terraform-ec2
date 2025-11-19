terraform {
  backend "s3" {
    bucket         = "mybucket-keerthika"  # Replace with your S3 bucket name
    key            = "ec2/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "mytable"           # Locking table name
    encrypt        = true
  }
}

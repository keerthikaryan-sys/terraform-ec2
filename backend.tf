terraform {
  backend "s3" {
    bucket         = "mybucket-keerthika1"  # Replace with your S3 bucket name
    key            = "ec2/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "mytable1"           # Locking table name
    encrypt        = true
  }
}

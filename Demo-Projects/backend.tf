terraform {
  backend "s3" {
    bucket = "mys3-bucket-for-terraform-demo-backend"
    key    = "mys3/remote/terraform/base-infra/terraform.tfstate"
    region = "ap-south-1"
    dynamodb_table = "dynamodb-state-locking"
  }
}

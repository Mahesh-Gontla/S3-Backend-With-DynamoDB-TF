#Before provisioning this, have to create s3 bucket and dynamoDB table manually



provider "aws" {
   region     = "ap-south-1"

}

resource "aws_instance" "ec2_example" {
    ami = "ami-00bb6a80f01f03502"
    instance_type = "t2.micro"
    tags = {
      Name = "EC2 Instance-Remote State"
    }
}

terraform {
    backend "s3" {
        bucket = "mys3-bucket-for-terraform-demo-backend"
        key    = "demo/terraform/remote/s3/terraform.tfstate"
        region     = "ap-south-1"
        dynamodb_table = "dynamodb-state-locking"
    }
}

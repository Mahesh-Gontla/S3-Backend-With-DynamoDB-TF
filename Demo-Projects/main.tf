provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "MyEC2InstanceUsingTF" {
  instance_type = "t2.micro"
  ami = "ami-00bb6a80f01f03502" # change this
  #subnet_id = "subnet-0f0ce07de9950e13b" # change this
  tags = {
      Name = "EC2 Instance-Remote State with Developer-2"
  }
}

resource "aws_s3_bucket" "mys3-bucket-for-terraform-demo-backend" {
  bucket = "mys3-bucket-for-terraform-demo-backend" 
  #versioning {
   # enabled = true
  #}
  tags = {
    Name        = "mys3-bucket-for-terraform-demo-backend"
    Environment = "Dev"
  }
}

resource "aws_dynamodb_table" "dynamodb-state-locking" {
  name         = "dynamodb-state-locking"
  hash_key     = "LockId"
  billing_mode = "PAY_PER_REQUEST"

  attribute {
    name = "LockId"
    type = "S"
  }

  tags = {
    Name        = "dynamodb-state-locking"
    Environment = "Dev"
  }
}





module "ec2-instance" {
      source = "./EC2"
}

module "s3" {
      source = "./S3"
}

module "vpc" {
      source = "./VPC"
}
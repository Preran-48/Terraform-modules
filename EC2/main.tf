resource "aws_instance" "web" {
  ami           = "ami-03ff09c4b716e6425"
  instance_type = var.inst_type

  tags = {
    Name = "ec2-tf-inst-m1"
  }
}
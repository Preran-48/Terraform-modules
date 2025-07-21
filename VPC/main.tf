# Creating VPC
resource "aws_vpc" "vpc-tf" {
  cidr_block       = "10.0.0.0/24"
  instance_tenancy = "default"

  tags = {
    Name = "tf-vpc"
  }
}

# Creating Public Subnet
resource "aws_subnet" "public-subnet" { 
  vpc_id     = aws_vpc.vpc-tf.id
  cidr_block = "10.0.0.0/25"

  tags = {
    Name = "tf-public-sn"
  }
}

# Creating Private Subnet

resource "aws_subnet" "private-subnet" { 
  vpc_id     = aws_vpc.vpc-tf.id
  cidr_block = "10.0.0.128/25"

  tags = {
    Name = "tf-private-sn"
  }
}

# Create Internet Gateway

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc-tf.id

  tags = {
    Name = "Tf-igw"
  }
}

# Creating Public Route table
resource "aws_route_table" "pub_rt" {  
  vpc_id = aws_vpc.vpc-tf.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public_rt"
  }
}

# Creating Private Route table

resource "aws_route_table" "priv_rt" {  
  vpc_id = aws_vpc.vpc-tf.id

  tags = {
    Name = "private_rt"
  }
}

# Public rt association with public sn
resource "aws_route_table_association" "public_ass" {
  subnet_id      = aws_subnet.public-subnet.id
  route_table_id = aws_route_table.pub_rt.id
}

# Private rt association with private sn
resource "aws_route_table_association" "private_ass" {
  subnet_id      = aws_subnet.private-subnet.id
  route_table_id = aws_route_table.priv_rt.id
}
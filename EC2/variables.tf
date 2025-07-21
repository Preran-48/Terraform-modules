variable "region" {
      description = "The region to create resources"
      type = string
      default = "ap-northeast-2"
}

variable "inst_type" {
      description = "the instance type is"
      type = string
      default = "t3.micro"
}
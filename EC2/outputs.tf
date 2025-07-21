output "instance_id" {
      value = aws_instance.web.id
      description = "The instance id is "
      sensitive = false
}

output "public_ip" {
      value = aws_instance.web.public_ip
      description = "the public  ip is"
}
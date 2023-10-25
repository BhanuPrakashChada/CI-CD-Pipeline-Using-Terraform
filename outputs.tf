output "jenkins-server-url" {
  value = join ("", ["http://", aws_instance.ec2-with-terraform.public_dns, ":", "8080"])
}

output "ec2-ssh-command" {
  value = join ("", ["ssh -i local_private_key ec2-user@", aws_instance.ec2-with-terraform.public_dns])
}
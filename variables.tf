variable "aws_region" {
    type = string
    default = "us-east-2"  
}
variable "ami_id" {
    type    = string
    default = "ami-0fa399d9c130ec923"
}

variable "instance_type" {
    type    = string
    default = "t2.micro"
}

variable "key_name" {
    type    = string
    default = "terraform-keypair"
}
variable "bucket-name" {
    type    = string
    default = "s3-bucket-jenkinserver-bhanuadmin"
}

variable "acl-type" {
    type    = string
    default = "private"
}
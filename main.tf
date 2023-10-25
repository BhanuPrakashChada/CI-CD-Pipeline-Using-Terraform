resource "aws_instance" "ec2-with-terraform" {
  ami           = var.ami_id 
  instance_type = var.instance_type
  key_name                    = var.key_name
  associate_public_ip_address = true 
  user_data = file("jenkins_installer.sh")
  vpc_security_group_ids      = [aws_security_group.jenkins-sg.id] 
  tags = {
    Name = "Devops-Project1"
  }
  
}

resource "aws_security_group" "jenkins-sg" {
  name        = "jenkins-sg"
  description = "Allow Port 22 and 8080"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_s3_bucket" "s3-bucket-for-Jenkins" {
  bucket = var.bucket-name
  tags = {
    Name = "Jenkins-Server"
  }
}

resource "aws_s3_bucket_acl" "s3_bucket_acl" {
  bucket = aws_s3_bucket.s3-bucket-for-Jenkins.id
  acl    = var.acl-type
  depends_on = [aws_s3_bucket_ownership_controls.s3_bucket_acl_ownership]
}

resource "aws_s3_bucket_ownership_controls" "s3_bucket_acl_ownership" {
  bucket = aws_s3_bucket.s3-bucket-for-Jenkins.id
  rule {
    object_ownership = "ObjectWriter"
  }
}
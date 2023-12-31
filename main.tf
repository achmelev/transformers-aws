####################Variablen######################

variable "region" {
  type = string
  default = "eu-central-1"
}

variable "availability_zone" {
  type = string
  default = "eu-central-1a"
}

variable "vpc" {
  type = string
  default = "vpc-9d0549f4"
}

variable "subnet" {
  type = string
  default = "subnet-35a4835c"
}

variable "secgroup" {
  type = string
  default = "sg-073f93f858554a0d4"
}

variable "ami" {
  type = string
  #Ubuntu 22.04
  default = "ami-04e601abe3e1a910f"
}

variable "keyname" {
  type = string
  default = "Transformers"
}

variable "itype" {
  type = string
}

variable "volume_size" {
  type = number
  default = 40
}

variable "instance_user" {
  type = string
  default = "ubuntu"
}

variable "private_key" {
  type = string
  default = "Transformers.pem"
}

variable "install_script" {
  type = string
  default = "nothing.sh"
}

###################################################


provider "aws" {
  region = var.region
}

resource "aws_instance" "transformers" {
  ami = var.ami
  availability_zone = var.availability_zone
  instance_type = var.itype
  subnet_id = var.subnet
  associate_public_ip_address = true
  key_name = var.keyname

  vpc_security_group_ids = [
    var.secgroup
  ]
  root_block_device {
    delete_on_termination = true
    volume_size = var.volume_size
    volume_type = "gp2"
  }

  provisioner "local-exec" {
    command = "sleep 10"
  }

  provisioner "local-exec" {
    command = "scp -o StrictHostKeyChecking=accept-new -i ${var.private_key} ${var.install_script} ${var.instance_user}@${self.public_dns}:${var.install_script}"
  }
  provisioner "local-exec" {
    command = "ssh -i ${var.private_key} ${var.instance_user}@${self.public_dns} \"chmod 755 ${var.install_script}\""
  }

  provisioner "local-exec" {
    command = "ssh -i ${var.private_key} ${var.instance_user}@${self.public_dns} ./${var.install_script}"
  }
}


output "DNS" {
  value = aws_instance.transformers.public_dns
}
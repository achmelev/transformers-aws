variable "awsprops" {
    type = map(string)
    default = {
        region = "eu-central-1"
        availability_zone = "eu-central-1a"
        vpc = "vpc-9d0549f4"
        #Debian original AMI
        #ami = "ami-0b0c5a84b89c4bf99"
        #Debian + Pytorch
        ami = "ami-04f26472799f42412"
        #itype = "t2.medium"
        itype = "g2.2xlarge"
        subnet = "subnet-35a4835c"
        publicip = true
        keyname = "Transformers"
        secgroup = "sg-073f93f858554a0d4"
    }
}

provider "aws" {
  region = lookup(var.awsprops, "region")
}

resource "aws_instance" "transformers" {
  ami = lookup(var.awsprops, "ami")
  availability_zone = lookup(var.awsprops, "availability_zone")
  instance_type = lookup(var.awsprops, "itype")
  subnet_id = lookup(var.awsprops, "subnet") 
  associate_public_ip_address = lookup(var.awsprops, "publicip")
  key_name = lookup(var.awsprops, "keyname")

  vpc_security_group_ids = [
    lookup(var.awsprops, "secgroup")
  ]
  root_block_device {
    delete_on_termination = true
    volume_size = 40
    volume_type = "gp2"
  }

  /*provisioner "remote-exec" {
    connection {
      host        = "${self.public_dns}"
      user        = "admin"
      type        = "ssh"
      private_key = "${file("Transformers.pem")}"
      timeout     = "2m"
    }
    script = "install.sh"
  }*/
}


output "DNS" {
  value = aws_instance.transformers.public_dns
}
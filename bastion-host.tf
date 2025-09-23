# EC2 Instance
resource "aws_instance" "bastion" {               #EC2 instance  for my entire infractructure and if it down, no one cant access anything so i have to make it high available 
  ami                    = data.aws_ami.amzlinux2.id                      #by create two ec2 or 3 ec2 instance for multiple availablility zone.
  instance_type          = "t2.micro"
  user_data              = file("${path.module}/bastion-user-data/bastion-host-user-data.sh")
  key_name               = "jenkins-key"
  vpc_security_group_ids = [aws_security_group.ssh_http_sg.id]     # coming from bastion-host-sg.tf

  subnet_id = data.aws_subnet.eks_public_subnet_01.id    # coming from data source    aws_subnet" "eks_public_subnet_01

  tags = {
    "Name" = "bastion-host"
  }
}


# Create Elastic IP for Bastion Host          # this is to avoid the change ip address for our domaine. 
resource "aws_eip" "bastion_eip" {
  instance = aws_instance.bastion.id
  vpc      = true
  tags = {
    "Name" = "Bastion Pulic IP"
  }
}


# Create a Null Resource and Provisioners
resource "null_resource" "copy_ec2_keys" {
  depends_on = [aws_instance.bastion]
  # Connection Block for Provisioners to connect to EC2 Instance
  connection {
    type        = "ssh"
    host        = aws_eip.bastion_eip.public_ip      
    user        = "ubuntu"#"ec2-user"       #user
    password    = ""
    private_key = file("private-key/jenkins-key.pem")     # use key authentification
  }

  ## File Provisioner: Copies the jenkins-key.pem file to /tmp/jenkins-key.pem
  provisioner "file" {
    source      = "private-key/jenkins-key.pem"
    destination = "/tmp/jenkins-key.pem"
  }
  ## Remote Exec Provisioner: Using remote-exec provisioner fix the private key permissions on Bastion Host
  provisioner "remote-exec" {
    inline = [
      "sudo chmod 400 /tmp/jenkins-key.pem"         # permission change give all the permission
    ]
  }
}

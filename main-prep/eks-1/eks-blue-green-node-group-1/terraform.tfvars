aws_region = "us-east-1"

common_tags = {
  "AssetID"       = "123"
  "Environment"   = "dev"
  "Project"       = "pipeline-eks1"
  "CreateBy"      = "Terraform"
  "cloudProvider" = "aws"
}

eks_version  = "1.31"
node_min     = "1"
desired_node = "1"
node_max     = "1"

blue_node_color  = "blue"
green_node_color = "green"

blue  = false
green = true

ec2_ssh_key               = "terraform-key"        # one mistake took me 1/2 day to figure out that my namekey pair was different.
deployment_nodegroup      = "blue_green"      # video 30:00  
capacity_type             = "ON_DEMAND"
ami_type                  = "AL2_x86_64"
instance_types            = "t2.large"
disk_size                 = "30"
shared_owned              = "shared"
enable_cluster_autoscaler = "true"






#To maintain the same IP address, you can associate an Elastic IP (EIP) to your EC2 instance.#

#resource "aws_eip" "example" {
#  instance = aws_instance.example.id
#  vpc      = true
#}
#
#resource "aws_instance" "example" {
#  ami           = "ami-0abcdef1234567890"
#  instance_type = "t2.micro"
#}

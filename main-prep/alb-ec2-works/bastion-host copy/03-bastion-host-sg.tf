
resource "aws_security_group" "ssh_http_sg" {              # 
  name_prefix = "ssh-http-sg"
  description = "Allow all inbound traffic from port 22 and 80"
  vpc_id      = data.aws_vpc.adl_eks_vpc.id    #from data 05 data source,tf 

   tags = {
    "Name" = "bastion-host"
  }
                                 
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group_rule" "webserver_allow_all_ssh" {   # to connect on ssh 
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.ssh_http_sg.id
}

resource "aws_security_group_rule" "webserver_allow_all_http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80                                     # to connect to the brwoser
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.ssh_http_sg.id
}

resource "aws_security_group_rule" "webserver_allow_all_ping" {      # to allow ping
  type              = "ingress"
  from_port         = 8
  to_port           = 0
  protocol          = "icmp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.ssh_http_sg.id
}

resource "aws_security_group_rule" "webserver_allow_all_outbound" {        # only for trafic out 
  type              = "egress"
  from_port         = 0
  to_port           = 0                  
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.ssh_http_sg.id
}



# how to create sg ?
                        # port 8080    for jenkins
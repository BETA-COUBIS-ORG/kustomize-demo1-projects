# https://registry.terraform.io/modules/terraform-aws-modules/alb/aws/latest    video 7 tia project 1:32 around 


# Terraform AWS Application Load Balancer (ALB)
module "alb" {
  source = "terraform-aws-modules/alb/aws"
  #   version = "5.16.0"
  version = "8.1.0"

  name                       = "webserver-alb"  # name of my alb
  internal                   = false             #
  enable_deletion_protection = false             # none cant delete until you desable  if true 
  load_balancer_type         = "application"
  vpc_id                     = data.aws_vpc.main.id                #vpc id change why? 
  security_groups            = [aws_security_group.alb-webserver-sg.id]    #from sg  alb    line 1
  subnets = [
    data.aws_subnet.public-subnet-02.id,
    data.aws_subnet.public-subnet-01.id
    #"subnet-0b24ef8cc4db253a0",
    #"subnet-02c35db4695bb887a"   
  ]

  # Listeners
  http_tcp_listeners = [{
    port               = 80
    protocol           = "HTTP"
    target_group_index = 0
    action_type        = "redirect"
    redirect = {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
    }
  ]
                                   ##2:29:30  video 7  terraform project enable  (40)
  https_listeners = [{
    port               = 443
    protocol           = "HTTPS"
    certificate_arn    = "arn:aws:acm:us-east-1:941638438583:certificate/ce5675f5-5336-4855-890d-515d1440d91b"  # from aws certificate manager ARN  video 7 tia project 1:47:15
    target_group_index = 0
  }]

  # Target Groups
  target_groups = [{
    backend_protocol     = "HTTP"
    backend_port         = 80
    target_type          = "instance"
    deregistration_delay = 10
    health_check = {
      enabled             = true
      interval            = 30
      path                = "/index.html"
      port                = "traffic-port"
      healthy_threshold   = 3
      unhealthy_threshold = 3
      timeout             = 6
      protocol            = "HTTP"
      matcher             = "200"
    }

    # Target Group   1:52 tia video project  7 
    targets = {
      my_app1_vm1 = {
        target_id = module.ec2_private1.id
        port      = 80
      },
      my_app1_vm2 = {
        target_id = module.ec2_private2.id
        port      = 80
      }
    }
    tags = { # Target Group Tags
      Name = "Websers-alb"
    }
  }]
  tags = { # ALB Tags
    Name = "Websers-target-group"
  }
}

resource "aws_alb" "alb" {
  name            = "alb"
  security_groups = ["${aws_security_group.alb.id}"]
  subnets         = ["${aws_subnet.subnet-public-1.id}", "${aws_subnet.subnet-public-2.id}"]



  tags = {
    Project     = "VPC_Task"
    Environment = "Test"
    Team        = "DevOps"
    Created_by  = "Bermet_Akylbekova"
  }
}

resource "aws_lb_target_group" "alb-tg" {
  name     = "target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc.id
  health_check {
    healthy_threshold   = 2
    interval            = 30
    protocol            = "HTTP"
    unhealthy_threshold = 2
  }
  tags = {
    Project     = "VPC_Task"
    Environment = "Test"
    Team        = "DevOps"
    Created_by  = "Bermet_Akylbekova"
  }
}

resource "aws_lb_target_group_attachment" "attach-instance1" {
  target_group_arn = aws_lb_target_group.alb-tg.arn
  target_id        = aws_instance.myinstance1.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "attach-instance2" {
  target_group_arn = aws_lb_target_group.alb-tg.arn
  target_id        = aws_instance.myinstance2.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "attach-instance3" {
  target_group_arn = aws_lb_target_group.alb-tg.arn
  target_id        = aws_instance.myinstance3.id
  port             = 80
}

resource "aws_lb_listener" "listeners" {
  load_balancer_arn = aws_alb.alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb-tg.arn
  }
}
resource "aws_lb" "alpha_alb" {
  name               = "alpha-vpc-application-lb"
  load_balancer_type = "application"
  internal           = false
  security_groups    = [aws_security_group.alpha_web_sg.id]
  subnets            = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id]
}

resource "aws_lb_target_group" "alpha_alb_tg" {
  name     = "alpha-alb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.alpha_vpc.id
}

resource "aws_lb_target_group_attachment" "alpha_alb_attachment_1" {
  target_group_arn = aws_lb_target_group.alpha_alb_tg.arn
  target_id        = aws_instance.webserver_1.id
  port             = 80

  depends_on = [
    aws_instance.webserver_1,
  ]
}

resource "aws_lb_target_group_attachment" "alpha_alb_attachment_2" {
  target_group_arn = aws_lb_target_group.alpha_alb_tg.arn
  target_id        = aws_instance.webserver_2.id
  port             = 80

  depends_on = [
    aws_instance.webserver_2,
  ]
}

resource "aws_lb_listener" "alpha_alb_listener" {
  load_balancer_arn = aws_lb.alpha_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alpha_alb_tg.arn
  }
}

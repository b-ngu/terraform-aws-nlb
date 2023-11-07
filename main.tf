provider "aws" {
  region = var.region
}

resource "aws_lb" "this" {
  name                       = var.nlb_name
  internal                   = var.internal
  load_balancer_type         = "network"
  subnets                    = var.subnet_ids
  enable_deletion_protection = var.enable_deletion_protection
  enable_cross_zone_load_balancing = var.enable_cross_zone_load_balancing

  tags = merge(
    { "Name" = "${local.resource_prefix}-nlb" },
    var.tags,
  )
}

resource "aws_lb_listener" "this" {
  load_balancer_arn = aws_lb.this.arn
  port              = var.listener_port
  protocol          = "TCP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }
}

resource "aws_lb_target_group" "this" {
  name     = var.target_group_name
  port     = var.target_group_port
  protocol = "TCP"
  vpc_id   = var.vpc_id
}

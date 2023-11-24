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
  for_each = { for idx, pc in var.port_configurations : idx => pc }

  load_balancer_arn = aws_lb.this.arn
  port              = each.value.listener_port
  protocol          = each.value.protocol

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this[each.key].arn
  }

  # Include certificate_arn for TLS listener
  certificate_arn = each.value.protocol == "TLS" ? each.value.certificate_arn : null

  # Include ssl_policy for TLS listener
  ssl_policy = each.value.protocol == "TLS" ? each.value.ssl_policy : null
}

resource "aws_lb_target_group" "this" {
  for_each = { for idx, pc in var.port_configurations : idx => pc }

  name     = "${var.target_group_name}-${each.value.target_group_port}"
  port     = each.value.target_group_port
  protocol = each.value.protocol
  vpc_id   = var.vpc_id
}
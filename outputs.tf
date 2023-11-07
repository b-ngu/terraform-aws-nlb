output "nlb_arn" {
  description = "The ARN of the Network Load Balancer"
  value       = aws_lb.this.arn
}

output "nlb_dns_name" {
  description = "The DNS name of the Network Load Balancer"
  value       = aws_lb.this.dns_name
}

output "listener_arn" {
  description = "The ARN of the listener"
  value       = aws_lb_listener.this.arn
}

output "target_group_arn" {
  description = "The ARN of the target group"
  value       = aws_lb_target_group.this.arn
}

provider "aws" {
  region = var.region
}

module "network_load_balancer" {
  source = "../../"

  contact     = var.contact
  environment = var.environment
  team        = var.team
  purpose     = var.purpose

  region = "us-west-2"
  subnet_ids = ["subnet-0bb1c79de3EXAMPLE", "subnet-0bb1c79de3EXAMPLE", "subnet-0bb1c79de3EXAMPLE"]
  vpc_id = "vpc-0bb1c79de3EXAMPLE"

  nlb_name = "my-nlb"
  internal = false
  enable_deletion_protection = false
  enable_cross_zone_load_balancing = true

  listener_port = 80
  target_group_name = "my-target-group"
  target_group_port = 80
}
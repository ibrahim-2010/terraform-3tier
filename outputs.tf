# Outputs for 3-Tier Architecture - STARTER FILE
# ================================================
# These outputs display useful information after terraform apply.
#
# IMPORTANT: Uncomment outputs as you uncomment the corresponding resources.
# If a resource is still commented out, its output must stay commented too,
# or Terraform will error with "resource not found".
#
# LocalStack Community Note:
# - VPC, Subnet, Security Group, and EC2 outputs work on LocalStack Community.
# - ALB and RDS outputs require LocalStack Pro (elbv2 and rds are Pro-only services).
#   Keep them commented when using LocalStack Community.
# - On real AWS, uncomment everything.

# =============================================================================
# VPC Outputs (uncomment after completing vpc.tf)
# =============================================================================
# output "vpc_id" {
#   description = "VPC ID"
#   value       = aws_vpc.main.id
# }
#
# output "public_subnet_ids" {
#   description = "Public subnet IDs"
#   value       = aws_subnet.public[*].id
# }
#
# output "private_app_subnet_ids" {
#   description = "Private app subnet IDs"
#   value       = aws_subnet.private_app[*].id
# }
#
# output "private_db_subnet_ids" {
#   description = "Private database subnet IDs"
#   value       = aws_subnet.private_db[*].id
# }

# =============================================================================
# ALB Outputs (uncomment after completing alb.tf)
# NOTE: Requires LocalStack Pro or real AWS — elbv2 is not in Community Edition
# =============================================================================
# output "alb_dns_name" {
#   description = "ALB DNS name"
#   value       = aws_lb.main.dns_name
# }
#
# output "alb_arn" {
#   description = "ALB ARN"
#   value       = aws_lb.main.arn
# }
#
# output "alb_url" {
#   description = "Application URL"
#   value       = "http://${aws_lb.main.dns_name}"
# }

# =============================================================================
# EC2 Outputs (uncomment after completing ec2.tf)
# =============================================================================
# output "web_instance_ids" {
#   description = "Web tier instance IDs"
#   value       = var.use_ecs ? [] : aws_instance.web[*].id
# }
#
# output "web_instance_private_ips" {
#   description = "Web tier private IPs"
#   value       = var.use_ecs ? [] : aws_instance.web[*].private_ip
# }
#
# output "app_instance_ids" {
#   description = "App tier instance IDs"
#   value       = var.use_ecs ? [] : aws_instance.app[*].id
# }
#
# output "app_instance_private_ips" {
#   description = "App tier private IPs"
#   value       = var.use_ecs ? [] : aws_instance.app[*].private_ip
# }

# =============================================================================
# ECS Outputs (uncomment if using ECS path)
# =============================================================================
# output "ecs_cluster_name" {
#   description = "ECS cluster name"
#   value       = var.use_ecs ? aws_ecs_cluster.main[0].name : null
# }
#
# output "ecs_web_service_name" {
#   description = "ECS web service name"
#   value       = var.use_ecs ? aws_ecs_service.web[0].name : null
# }
#
# output "ecs_app_service_name" {
#   description = "ECS app service name"
#   value       = var.use_ecs ? aws_ecs_service.app[0].name : null
# }

# =============================================================================
# RDS Outputs (uncomment after completing rds.tf)
# NOTE: Requires LocalStack Pro or real AWS — rds is not in Community Edition
# =============================================================================
# output "db_endpoint" {
#   description = "RDS endpoint"
#   value       = aws_db_instance.main.endpoint
# }
#
# output "db_name" {
#   description = "Database name"
#   value       = aws_db_instance.main.db_name
# }
#
# output "db_port" {
#   description = "Database port"
#   value       = aws_db_instance.main.port
# }

# =============================================================================
# Security Group Outputs (uncomment after completing security.tf)
# =============================================================================
# output "alb_security_group_id" {
#   description = "ALB security group ID"
#   value       = aws_security_group.alb.id
# }
#
# output "web_security_group_id" {
#   description = "Web tier security group ID"
#   value       = aws_security_group.web.id
# }
#
# output "app_security_group_id" {
#   description = "App tier security group ID"
#   value       = aws_security_group.app.id
# }
#
# output "db_security_group_id" {
#   description = "Database security group ID"
#   value       = aws_security_group.db.id
# }

# =============================================================================
# Summary Output (uncomment when all resources are created)
# =============================================================================
# output "summary" {
#   description = "Infrastructure summary"
#   value = <<-EOT
#
#     ============================================
#     3-Tier Architecture Deployment Summary
#     ============================================
#
#     Mode: ${var.use_ecs ? "ECS/Fargate (Containerized)" : "EC2 (Traditional)"}
#
#     Application URL: http://${aws_lb.main.dns_name}
#
#     VPC: ${aws_vpc.main.id}
#     - Public Subnets: ${join(", ", aws_subnet.public[*].id)}
#     - App Subnets: ${join(", ", aws_subnet.private_app[*].id)}
#     - DB Subnets: ${join(", ", aws_subnet.private_db[*].id)}
#
#     ${var.use_ecs ? "ECS Cluster: ${aws_ecs_cluster.main[0].name}" : "Web Instances: ${join(", ", aws_instance.web[*].id)}"}
#     ${var.use_ecs ? "Web Service: ${aws_ecs_service.web[0].name}" : "App Instances: ${join(", ", aws_instance.app[*].id)}"}
#
#     Database: ${aws_db_instance.main.endpoint}
#
#     ============================================
#   EOT
# }

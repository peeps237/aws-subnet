output "subnet_id" {
  value       = aws_subnet.main.id
  description = "The ID of the subnet"
}

output "subnet_arn" {
  value       = aws_subnet.main.arn
  description = "The ARN of the subnet"
}

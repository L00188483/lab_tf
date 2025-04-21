output "public_instance_ip" {
  value       = aws_instance.public_jumpbox.public_ip
  description = "Public IP of the EC2 instance in the public subnet"
}

output "load_balancer_dns" {
  value       = aws_lb.app.dns_name
  description = "Public DNS of the Load Balancer"
}

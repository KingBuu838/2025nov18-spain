output "ip_address" {
  value = aws_instance.valkyrie-time.public_ip
}

output "website_url" {
  value = "http://${aws_instance.valkyrie-time.public_dns}"
}

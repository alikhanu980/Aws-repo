output "vpc_id" {
  value = aws_vpc.main.id
}

output "subnet_ids" {
  value = aws_subnet.main[*].id
}

output "ec2_instance_id" {
  value = aws_instance.web.id
}

output "rds_instance_endpoint" {
  value = aws_db_instance.default.endpoint
}

output "s3_bucket_arn" {
  value = aws_s3_bucket.b.arn
}

output "s3_bucket_id" {
    value       = aws_s3_bucket.frontend_static_page_bucket.id
    description = "ID of the S3 bucket for frontend static page"
}
output "bucket_name" {
  description = "S3 bucket holding the built site."
  value       = aws_s3_bucket.site.id
}

output "distribution_id" {
  description = "CloudFront distribution ID (for cache invalidations)."
  value       = aws_cloudfront_distribution.site.id
}

output "site_url" {
  description = "Public HTTPS URL of the site."
  value       = "https://${aws_cloudfront_distribution.site.domain_name}"
}

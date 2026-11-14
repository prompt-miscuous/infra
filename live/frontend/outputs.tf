output "site_url" {
  description = "Public HTTPS URL of the frontend."
  value       = module.site.site_url
}

output "bucket_name" {
  description = "S3 bucket for `aws s3 sync` deploys."
  value       = module.site.bucket_name
}

output "distribution_id" {
  description = "CloudFront distribution ID for invalidations."
  value       = module.site.distribution_id
}

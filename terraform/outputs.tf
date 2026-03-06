output "bucket_name" {
  description = "Name of the created S3 bucket"
  value       = aws_s3_bucket.example_bucket.id
}

output "bucket_arn" {
  description = "ARN of the S3 bucket"
  value       = aws_s3_bucket.example_bucket.arn
}

output "sample_file_url" {
  description = "Uploaded sample file location"
  value       = "s3://${aws_s3_bucket.example_bucket.id}/${aws_s3_object.sample_file.key}"
}
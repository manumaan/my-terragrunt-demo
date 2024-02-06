# The S3 bucket
resource "aws_s3_bucket" "demo_bucket" {
  bucket_prefix = "${var.name}-${var.environment}-demo-bucket"
}

#block public access
resource "aws_s3_bucket_public_access_block" "demo_bucket_public_access_block" {
  bucket = aws_s3_bucket.demo_bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
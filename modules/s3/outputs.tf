output "bucket_name" {
  value = data.aws_s3_bucket.website.bucket
}


#output "bucket_name" {
#  value = aws_s3_bucket.website.id
#}

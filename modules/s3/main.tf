data "aws_s3_bucket" "website" {
  bucket = var.bucket_name
}






#resource "aws_s3_bucket" "website" {
#  bucket = var.bucket_name
#}

#resource "aws_s3_bucket_acl" "website_acl" {
#  bucket = aws_s3_bucket.website.id
#  acl    = "public-read"
#}
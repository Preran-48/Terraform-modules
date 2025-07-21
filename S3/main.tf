resource "aws_s3_bucket" "s3-bucket" {
  bucket = "my-tf-test-bucket-prac"

  tags = {
    Name        = "My bucket"
  }
}

resource "aws_s3_bucket_object" "object" {
  bucket = "my-tf-test-bucket-prac"
  key    = "sample.tf"
  source = "C:/Users/QSPR/Desktop/TF-S3/main.tf"

  # The filemd5() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the md5() function and the file() function:
  # etag = "${md5(file("path/to/file"))}"
  etag = filemd5("C:/Users/QSPR/Desktop/TF-S3/main.tf")
}
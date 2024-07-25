resource "aws_s3_bucket" "b" {
  bucket = "my-unique-bucket-nameeeeeer"

  tags = {
    Name = "my-s3-bucket"
  }
}

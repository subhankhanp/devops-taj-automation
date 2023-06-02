terraform {
  backend "s3" {
    bucket = "subhan-test"
    key = "server_name/qa1statefile"
    region = "ap-southeast-1"
  }
}

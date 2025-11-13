terraform {
  backend "s3" {
    bucket = "zdhbfhour"
    key    = "day-4/terraform.tfstate"
    region = "us-west-2"
    encrypt  = true
        # The following line enables S3-native locking
    use_lockfile   = true
  }
}

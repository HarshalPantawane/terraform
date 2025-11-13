terraform {
  backend "s3" {
    bucket = "jjsdnfuodfgurtxbnxfnigtlels"
    key    = "day-3/terraform.tfstate"
    region = "us-west-2"
  }
}

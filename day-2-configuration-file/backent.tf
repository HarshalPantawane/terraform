terraform {
  backend "s3" {
    bucket = "juodhcuohaue"
    key    = "day-2/terraform.tfstate"
    region = "us-west-2"
  }
}

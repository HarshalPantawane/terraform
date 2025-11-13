provider "aws" {
 alias = "east"
 region = "us-east-1"
 profile = "default"
}

provider "aws" {
  alias = "west"
  region = "us-west-2"
  profile = "dev"
}


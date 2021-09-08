provider "aws" {
  region  = "us-west-2"
}
terraform {
  backend "s3" {
    bucket = "vishnutfstate"
    key    = "tfstatefile"
    region = "us-west-2"
  }
}
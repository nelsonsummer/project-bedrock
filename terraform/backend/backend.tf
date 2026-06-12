terraform {
  backend "s3" {
    bucket = "bedrock-tfstate-altssoe0253369"
    key    = "project-bedrock/terraform.tfstate"
    region = "us-east-1"
  }
}

terraform {
  required_version = "~> 0.4"
  required_providers {
    aws = {
       source = "hashicorp/aws"
       version = "~> 4.0"
    }
  }
}

provider "aws" {
   region = "ap-southeast-1"


}
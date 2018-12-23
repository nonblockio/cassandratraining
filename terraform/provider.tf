# Configure the AWS Provider
provider "aws" {
  region                  = "AWS region"
  shared_credentials_file = "Path to AWS Credentials"
  profile                 = "Profile in AWS Credentials"
}

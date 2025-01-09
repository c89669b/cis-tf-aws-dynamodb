# Configure the AWS Provider
provider "aws" {
  profile =  var.profile
  region = var.region
  /*assume_role {
    role_arn     = "arn:aws:iam::851725162992:role/eec-aws-infrastructure-deployment-role"
    session_name = "terraform-session"
    external_id  = "76baec2019a311efa9fd0affedf1bdf7"
  } */
}

resource "aws_dynamodb_table" "dynamodb-table" {
  name         = "${var.table_name}-${var.environment}"
  billing_mode = var.billing_mode
  hash_key     = var.hash_key

  attribute {
    name = var.hash_key
    type = "S"
  }
  ttl {
    attribute_name = "TimeToExist"
    enabled        = true
  }

  tags = local.tags
}

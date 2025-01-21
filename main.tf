# Configure the AWS Provider
provider "aws" {
  /*profile =  var.profile*/
  region = var.region
  assume_role {
    role_arn     = var.role_arn
    session_name = "terraform-session"
    external_id  = var.external_id
  } 
}

resource "aws_dynamodb_table" "dynamodb-table" {
  name         = var.table_name
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

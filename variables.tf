# provider variable

variable "role_arn" {
  type        = string
  description = "AWS Event Role arn"
}


variable "external_id" {
  type        = string
  description = "AWS event role external id"
} 

/*variable "profile" {
  type        = string
  description = "AWS profile to login"
} */

variable "region" {
  type        = string
  description = "AWS region"

}

variable "environment" {
  type = string
}

variable "hash_key" {
  type        = string
  description = "Attribute to use as the hash (partition) key. Must also be defined as an attribute"
}

# table variable
variable "table_name" {  
  type        = string  
  description = "This is the name of the dynamodb table."
}

variable "billing_mode" {
  type        = string
  description = <<EOF
  Controls how you are charged for read and write throughput and how you manage
  capacity. The valid values are PROVISIONED and PAY_PER_REQUEST.
  Defaults to PAY_PER_REQUEST.
  EOF
  default     = "PAY_PER_REQUEST"
}

variable "read_capacity" {
  type        = number
  description = "Number of read units for this table. If the billing_mode is PROVISIONED, this field is required."
  default     = 10
}

variable "write_capacity" {
  type        = number
  description = "Number of write units for this table. If the billing_mode is PROVISIONED, this field is required."
  default     = 10
}


provider "aws" {}

provider "aws" {
  region     = "ap-south-1"
  access_key = ""
  secret_key = ""
  alias      = "Non-prod"
}

data "aws_caller_identity" "current" {}

data "aws_iam_users" "users" {}

variable "users" {
type = list
default = ["Sanath", "admin-users", "User"]
}

locals {
  account_id = data.aws_caller_identity.current.account_id
}

resource "aws_iam_user" "sanath-user" {
count = length(var.users)
  name = "${var.users[count.index]}-${local.account_id}"
}

output "users" {
value = data.aws_iam_users.users.names
}

output "No-Of-Users" {
value = length(data.aws_iam_users.users.names)
}

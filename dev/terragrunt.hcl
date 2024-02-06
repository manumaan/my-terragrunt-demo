#Keep your backend DRY
remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket = "tf-state-manum-0202041706"
    key = "${path_relative_to_include()}/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "tf-lock-table"
  }
}

#Keep your provider DRY
generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
provider "aws" {
  region = "us-east-1"
  profile = "admin"
  assume_role {
    role_arn = "arn:aws:iam::644107485976:role/github_actions_role"
  }
}
EOF
}

#Keep your CLI DRY, Before, After, Error hooks 
terraform {
  extra_arguments "common_vars" {
    commands = ["plan", "apply"]

    required_var_files = [
     "${get_parent_terragrunt_dir()}/account.tfvars",
     "${get_parent_terragrunt_dir()}/region.tfvars"
    ]
  }
    before_hook "before_hook" {
    commands     = ["apply", "plan"]
    execute      = ["tflint"]
  }

  after_hook "after_hook" {
    commands     = ["apply", "plan"]
    execute      = ["echo", "Finished running Terraform"]
    run_on_error = true
  }
    error_hook "import_resource" {
    commands  = ["apply"]
    execute   = ["echo", "Error Hook executed"]
    on_errors = [
      ".*",
    ]
  }
}

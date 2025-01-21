

dependency "random" {
 config_path = "../random"
  mock_outputs = {
    random_name = "mocked-value"
 }
}

inputs = {
  file_name = dependency.random.outputs.random_name
}


generate "provider" {
  path = "_provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
  #testing
terraform {
  required_version = "> 1.0"
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "2.5.2"
    }
  }
}
EOF
}
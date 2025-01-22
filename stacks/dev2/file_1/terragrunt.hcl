terraform {
  source = "../../../modules/file"
}

include {
  path = find_in_parent_folders()
}

locals {
  file_name = "file_1"
}

# dependency "random" {
#  config_path = "../random"
#   mock_outputs = {
#     random_name = "mocked-value"
#  }
# }

inputs = {
  file_name = local.file_name#dependency.random.outputs.random_name
  file_path = "${get_original_terragrunt_dir()}/${local.file_name}.txt"
}
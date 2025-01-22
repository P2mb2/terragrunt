terraform {
  source = "../../../modules/file"
}

include {
  path = find_in_parent_folders()
}

dependency "file_1" {
 config_path = "../file_1"
  mock_outputs = {
    file_path = "mocked-value"
 }
}

inputs = {
  file_path = "${dependency.file_1.outputs.file_path}_2.txt"
}
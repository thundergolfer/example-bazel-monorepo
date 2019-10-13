terraform {
  extra_arguments "conditional_vars" {
    commands = [
      "apply",
      "destroy",
      "plan",
      "import",
      "push",
      "refresh"
    ]

    required_var_files = [
      "${get_parent_terragrunt_dir()}/gcloud.tfvars"
    ]

    optional_var_files = [
      "${get_parent_terragrunt_dir()}/${get_env("TF_VAR_env", "dev")}.tfvars",
      "${get_terragrunt_dir()}/${get_env("TF_VAR_env", "dev")}.tfvars",
    ]

    arguments = [
      "-state=${get_env("TF_VAR_env", "dev")}.tfstate",
    ]
  }
}
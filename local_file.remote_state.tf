resource "local_file" "remote_state" {
  content  = data.template_file.remote_state.rendered
  filename = "terraform.tf"
}

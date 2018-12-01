data "template_file" "remote_state" {
  template = "${file("${path.module}/remote_state.tf.template")}"

  vars {
    account_number = "${data.aws_caller_identity.current.account_id}"
  }
}
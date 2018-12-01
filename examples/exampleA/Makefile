#Makefile

.PHONY: all

all: init plan build

init:
	rm -rf .terraform/modules/
	terraform init -reconfigure

plan: init
	terraform plan -refresh=true

lock:
	terraform apply -target module.statebucket.aws_dynamodb_table.dynamodb-state-lock -auto-approve

build: init
	terraform apply -auto-approve

check: init
	terraform plan -detailed-exitcode

destroy: init
	terraform destroy -force

docs:
	terraform-docs md . > README.md

valid:
	tflint
	terraform fmt -check=true -diff=true

first: init lock
	terraform apply -target module.statebucket.aws_s3_bucket.statebucket -auto-approve
	terraform apply -target module.statebucket.local_file.remote_state -lock=false -auto-approve
	terraform init -force-copy

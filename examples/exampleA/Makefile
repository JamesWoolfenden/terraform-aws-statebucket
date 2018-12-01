#Makefile

.PHONY: all

all: init plan build

init:
	rm -rf .terraform/modules/
	terraform init -reconfigure

plan: init
	terraform plan -refresh=true

lock:
	terraform apply -target aws_dynamodb_table.dynamodb-terraform-state-lock -lock=false -auto-approve

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
	terraform apply -target aws_s3_bucket.state_bucket -lock=false -auto-approve
    terraform apply -target module.statebucket.local_file.remote_state

#Makefile
ifdef OS
   BLAT = $(powershell  -noprofile rm .\.terraform\ -force -recurse)
   RM = $(powershell  -noprofile rm .\.terraform\ -force -recurse)
else
   ifeq ($(shell uname), Linux)
      RM  = rm .terraform/modules/ -fr
      BLAT= rm .terraform/ -fr
   endif
endif

.PHONY: all

all: init plan build

init:
	$(RM)
	terraform init -reconfigure

plan: init
	terraform plan -refresh=true

planned: init
	terraform plan -out tf.plan
	terraform show -json tf.plan  > tf.json
	checkov -f tf.json

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
	terraform fmt -recursive
	checkov -d . --external-checks-dir ../../checkov
	tfsec .
	terrascan scan

first: init lock
	terraform apply -target module.statebucket.aws_s3_bucket.statebucket -auto-approve
	terraform apply -target module.statebucket.local_file.remote_state -lock=false -auto-approve
	terraform init -force-copy

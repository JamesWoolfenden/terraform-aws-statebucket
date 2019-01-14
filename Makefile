#Makefile

.PHONY: all

all: init plan build

docs:
	terraform-docs md . > README.md

valid:
	tflint
	terraform fmt -check=true -diff=true

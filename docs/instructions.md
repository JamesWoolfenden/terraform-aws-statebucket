# Instructions

When working with Terraform as part of a team, instead of a local terrraform.tfstate file, a shared remote state store is required, for AWS this is S3 bucket.
But if we want to automate everything via Terraform?
Traditionally we would have to create the initial bucket by hand via the console or by the cli and the resource unmanaged.
The module and example solves the issue of creating a state bucket in Terraform using Terrraform itself.

## Chicken then Egg

The Makefile in folder _examples\examplesA_ has a number of tasks, one specifically to create the initial bucket:

```make
make first
```

This makes the lock DB table, the state (S3) bucket, fills out and creates the remote_state.tf file and then copies the state from the local disk to the bucket.PHEW. The State of the bucket is now managed along with any future resources.

On the second and subsequent runs you use:

```make
make build
```

## Features

This module implements state locking via DynamoDB, Versioning on files within the bucket and finally MFA Based deletes of the bucket itself.

The module also uses a tagging based on the map variable common_tags scheme.

This Scheme here uses as a minimum (in your terraform.tfvars):
common_tags = {
Application = "terraform"
Module = "statebucket"
Environment = "develop"
}

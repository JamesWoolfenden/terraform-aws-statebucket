# TERRAFORM-AWS-STATEBUCKET
When working with Terraform as part of a team then a remote state store is required, for AWS this is S3 bucket.
The pattern then found is to create the initial bucket by hand via the console or by the cli and the resource unmanaged. 
The module and example solves the issue of creating a state bucket in Terraform using Terrraform.
## How
The Makefile in examples\examples can a number of tasks to create the initial bucket:
```
make first
```

The module makes the state bucket and creates the linking file called remote_state.tf.
On the second run use:
```
make build
``` 
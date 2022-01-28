# terraform-aws-statebucket

[![Build Status](https://github.com/JamesWoolfenden/terraform-aws-statebucket/workflows/Verify%20and%20Bump/badge.svg?branch=master)](https://github.com/JamesWoolfenden/terraform-aws-statebucket)
[![Latest Release](https://img.shields.io/github/release/JamesWoolfenden/terraform-aws-statebucket.svg)](https://github.com/JamesWoolfenden/terraform-aws-statebucket/releases/latest)
[![GitHub tag (latest SemVer)](https://img.shields.io/github/tag/JamesWoolfenden/terraform-aws-statebucket.svg?label=latest)](https://github.com/JamesWoolfenden/terraform-aws-statebucket/releases/latest)
![Terraform Version](https://img.shields.io/badge/tf-%3E%3D0.14.0-blue.svg)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/JamesWoolfenden/terraform-aws-statebucket/cis_aws)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=JamesWoolfenden%2Fterraform-aws-statebucket&benchmark=CIS+AWS+V1.2)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![checkov](https://img.shields.io/badge/checkov-verified-brightgreen)](https://www.checkov.io/)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/jameswoolfenden/terraform-aws-statebucket/general)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=JamesWoolfenden%2Fterraform-aws-statebucket&benchmark=INFRASTRUCTURE+SECURITY)

Terraform module to provision a secure terraform state bucket for team use of IAC.

---

It's 100% Open Source and licensed under the [APACHE2](LICENSE).

## Versions

| Terraform Version | Statebucket Release |
| :---------------: | :-----------------: |
|      0.12.x       |        0.3.0        |
|      0.11.x       |       0.2.25        |

## Usage

Include this repository as a module in your existing Terraform code:

```HCL
module statebucket {
  source      = "JamesWoolfenden/statebucket/aws"
  version     = "0.3.1"
  common_tags = var.common_tags
}
```

Set-up as per example.

Use the generated `remote_state.tf` and change the bucket key for each subsequent service as required

```hcl
terraform {
...

  backend "s3" {
    ...

    key = "<your-service>/<provider-service>/terraform.tfstate"
    ...
  }
}
```

## Instructions

When working with Terraform as part of a team, instead of a local **terraform.tfstate** file, a shared remote state store is required, for AWS this is a S3 bucket.
But if we want to automate everything via Terraform?
Traditionally we would have to create the initial bucket by hand via the console or by the cli and the resource unmanaged.
The module and example solves the issue of creating a state bucket in Terraform using Terraform itself.

### Chicken then Egg

The Makefile in folder _examples\examplesA_ has a number of tasks, one specifically to create the initial bucket:

```sh
make first
```

This makes the lock DB table, the state (S3) bucket, fills out and creates the remote_state.tf file and then copies the state from the local disk to the bucket.PHEW. The State of the bucket is now managed along with any future resources.

On the second and subsequent runs you use:

```sh
make build
```

## Features

This module implements state locking via DynamoDB, Versioning on files within the bucket and finally MFA Based deletes of the bucket itself.

The module also uses a tagging based on the map variable common_tags scheme.

This Scheme here uses as a minimum (see _examplea.auto.tfvars_):

```HCL
common_tags = {
  application = "terraform"
  module      = "statebucket"
  environment = "develop"
  authors     = "James Woolfenden, Oliver Smit"
}
```

## Costs

```text
 Monthly cost estimate

Project: .

 Name                                                           Monthly Qty  Unit                Monthly Cost

 module.statebucket.aws_dynamodb_table.dynamodb-state-lock
 ├─ Write capacity unit (WCU)                                        14,600  WCU-hours                 $11.27
 ├─ Read capacity unit (RCU)                                         14,600  RCU-hours                  $2.25
 ├─ Data storage                                            Cost depends on usage: $0.30 per GB-months
 ├─ Point-In-Time Recovery (PITR) backup storage            Cost depends on usage: $0.24 per GB-months
 ├─ On-demand backup storage                                Cost depends on usage: $0.12 per GB-months
 ├─ Table data restored                                     Cost depends on usage: $0.18 per GB
 └─ Streams read request unit (sRRU)                        Cost depends on usage: $0.000000237 per sRRUs

 module.statebucket.aws_s3_bucket.state_bucket
 └─ Standard
    ├─ Storage                                              Cost depends on usage: $0.02 per GB-months
    ├─ PUT, COPY, POST, LIST requests                       Cost depends on usage: $0.0053 per 1k requests
    ├─ GET, SELECT, and all other requests                  Cost depends on usage: $0.00042 per 1k requests
    ├─ Select data scanned                                  Cost depends on usage: $0.00225 per GB-months
    └─ Select data returned                                 Cost depends on usage: $0.0008 per GB-months

 PROJECT TOTAL                                                                                         $13.53

```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Requirements

No requirements.

## Providers

| Name                                                            | Version |
| --------------------------------------------------------------- | ------- |
| <a name="provider_aws"></a> [aws](#provider_aws)                | n/a     |
| <a name="provider_local"></a> [local](#provider_local)          | n/a     |
| <a name="provider_template"></a> [template](#provider_template) | n/a     |

## Modules

No modules.

## Resources

| Name                                                                                                                                                        | Type        |
| ----------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| [aws_dynamodb_table.dynamodb-state-lock](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dynamodb_table)                        | resource    |
| [aws_s3_bucket.state_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket)                                         | resource    |
| [aws_s3_bucket_public_access_block.state_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource    |
| [local_file.remote_state](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file)                                               | resource    |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity)                               | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region)                                                 | data source |
| [template_file.remote_state](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file)                                      | data source |

## Inputs

| Name                                                                     | Description                                                                              | Type       | Default     | Required |
| ------------------------------------------------------------------------ | ---------------------------------------------------------------------------------------- | ---------- | ----------- | :------: |
| <a name="input_acl"></a> [acl](#input_acl)                               | Not Likely/Unwise to want a public state bucket, but here's the option                   | `string`   | `"private"` |    no    |
| <a name="input_common_tags"></a> [common_tags](#input_common_tags)       | This is the common tags scheme map type for applying tags on resources                   | `map(any)` | n/a         |   yes    |
| <a name="input_force_destroy"></a> [force_destroy](#input_force_destroy) | Set force_destroy property - unlikely to anything else but may want rid of at some point | `bool`     | `false`     |    no    |
| <a name="input_mfa_delete"></a> [mfa_delete](#input_mfa_delete)          | Object to control version behaviour                                                      | `bool`     | `false`     |    no    |
| <a name="input_sse_algorithm"></a> [sse_algorithm](#input_sse_algorithm) | The type of encryption algorithm to use                                                  | `string`   | `"aws:kms"` |    no    |

## Outputs

| Name                                                                                      | Description              |
| ----------------------------------------------------------------------------------------- | ------------------------ |
| <a name="output_bucket_domain_name"></a> [bucket_domain_name](#output_bucket_domain_name) | The FQDN for the bucket  |
| <a name="output_statebucket"></a> [statebucket](#output_statebucket)                      | The state bucket details |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Checkov Security tests

This module is scanned by Checkov - <https://checkov.io> and has 2 exclusions added:

```checkov
  #checkov:skip=CKV_AWS_18: "Ensure the S3 bucket has access logging enabled"
  #checkov:skip=CKV_AWS_52: "Ensure S3 bucket has MFA delete enabled"
```

These are added because access logging was not required, and that MFA delete was unsuitable and difficult to automate.

## Related Projects

Check out these related projects.

- [terraform-aws-s3](https://github.com/jameswoolfenden/terraform-aws-s3) - S3 buckets

## Help

**Got a question?**

File a GitHub [issue](https://github.com/JamesWoolfenden/terraform-aws-statebucket/issues).

## Contributing

### Bug Reports & Feature Requests

Please use the [issue tracker](https://github.com/JamesWoolfenden/terraform-aws-statebucket/issues) to report any bugs or file feature requests.

## Copyrights

Copyright © 2019-2022 James Woolfenden

## License

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

See [LICENSE](LICENSE) for full details.

Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements. See the NOTICE file
distributed with this work for additional information
regarding copyright ownership. The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at

<https://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied. See the License for the
specific language governing permissions and limitations
under the License.

### Contributors

[![James Woolfenden][jameswoolfenden_avatar]][jameswoolfenden_homepage]<br/>[James Woolfenden][jameswoolfenden_homepage]<br/>[![Oliver Smit][olmesm_avatar]][olmesm_homepage]<br/>[Oliver Smit][olmesm_homepage]

[jameswoolfenden_homepage]: https://github.com/jameswoolfenden
[jameswoolfenden_avatar]: https://github.com/jameswoolfenden.png?size=150
[olmesm_homepage]: https://github.com/olmesm
[olmesm_avatar]: https://github.com/olmesm.png?size=150
[github]: https://github.com/jameswoolfenden
[linkedin]: https://www.linkedin.com/in/jameswoolfenden/
[twitter]: https://twitter.com/JimWoolfenden
[share_twitter]: https://twitter.com/intent/tweet/?text=terraform-aws-statebucket&url=https://github.com/JamesWoolfenden/terraform-aws-statebucket
[share_linkedin]: https://www.linkedin.com/shareArticle?mini=true&title=terraform-aws-statebucket&url=https://github.com/JamesWoolfenden/terraform-aws-statebucket
[share_reddit]: https://reddit.com/submit/?url=https://github.com/JamesWoolfenden/terraform-aws-statebucket
[share_facebook]: https://facebook.com/sharer/sharer.php?u=https://github.com/JamesWoolfenden/terraform-aws-statebucket
[share_email]: mailto:?subject=terraform-aws-statebucket&body=https://github.com/JamesWoolfenden/terraform-aws-statebucket

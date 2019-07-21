
[![Slalom][logo]](https://slalom.com)

# terraform-aws-statebucket [![Build Status](https://travis-ci.com/JamesWoolfenden/terraform-aws-statebucket.svg?branch=master)](https://travis-ci.com/JamesWoolfenden/terraform-aws-statebucket) [![Latest Release](https://img.shields.io/github/release/JamesWoolfenden/terraform-aws-statebucket.svg)](https://github.com/JamesWoolfenden/terraform-aws-statebucket/releases/latest)

Terraform module to provision a secure terraform state bucket for team use of IAC.

---

It's 100% Open Source and licensed under the [APACHE2](LICENSE).

## Usage

Include this repository as a module in your existing terraform code:

```hcl
module "statebucket" {
source      = "JamesWoolfenden/statebucket/aws"
version     = "0.0.4"
common_tags = var.common_tags
}
```

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

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| common\_tags | This is a map type for applying tags on resources | map | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| bucket\_domain\_name | The FQDN for the bucket |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->


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

Copyright © 2019-2019 [Slalom, LLC](https://slalom.com)

## License

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

See [LICENSE](LICENSE) for full details.

Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements.  See the NOTICE file
distributed with this work for additional information
regarding copyright ownership.  The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License.  You may obtain a copy of the License at

<https://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied.  See the License for the
specific language governing permissions and limitations
under the License.

### Contributors

  [![James Woolfenden][jameswoolfenden_avatar]][jameswoolfenden_homepage]<br/>[James Woolfenden][jameswoolfenden_homepage]

  [jameswoolfenden_homepage]: https://github.com/jameswoolfenden
  [jameswoolfenden_avatar]: https://github.com/jameswoolfenden.png?size=150

[logo]: https://gist.githubusercontent.com/JamesWoolfenden/5c457434351e9fe732ca22b78fdd7d5e/raw/15933294ae2b00f5dba6557d2be88f4b4da21201/slalom-logo.png
[website]: https://slalom.com
[github]: https://github.com/jameswoolfenden
[linkedin]: https://www.linkedin.com/company/slalom-consulting/
[twitter]: https://twitter.com/Slalom

[share_twitter]: https://twitter.com/intent/tweet/?text=terraform-aws-statebucket&url=https://github.com/JamesWoolfenden/terraform-aws-statebucket
[share_linkedin]: https://www.linkedin.com/shareArticle?mini=true&title=terraform-aws-statebucket&url=https://github.com/JamesWoolfenden/terraform-aws-statebucket
[share_reddit]: https://reddit.com/submit/?url=https://github.com/JamesWoolfenden/terraform-aws-statebucket
[share_facebook]: https://facebook.com/sharer/sharer.php?u=https://github.com/JamesWoolfenden/terraform-aws-statebucket
[share_email]: mailto:?subject=terraform-aws-statebucket&body=https://github.com/JamesWoolfenden/terraform-aws-statebucket

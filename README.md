# Terraform TencentCloud COS SPA Module

This module provides an easy way to upload local Single Application Page Assets to TencentCloud Cloud Object Storage(COS) Bucket.

## Installation

### Requirement 

- [Terraform](https://www.terraform.io/downloads.html) >= 0.14.06
- [Terraform Provider for Tencent Cloud](https://github.com/terraform-providers/terraform-provider-tencentcloud) >= 1.60.19


## Usage

Configure your TencentCloud Credentials:
```
export TENCENTCLOUD_SECRET_ID = "AKIDxxxx"
export TENCENTCLOUD_SECRET_KEY = "xxxx"
```

Create `main.tf` at the project root

```hcl
terraform {
  required_providers {
    tencentcloud = {
      source = "tencentcloudstack/tencentcloud"
      version = ">=1.60.19"
    }
  }
}

variable "region" {
  default = "ap-guangzhou"
}

provider "tencentcloud" {
  region = var.region
}

resource "tencentcloud_cos_bucket" "foo" {
  bucket = "using-cos-module-1234567890"
}

module cos_spa {
  source = "github.com/Kagashino/terraform-module-tencentcloud-cos-spa"
  bucket = tencentcloud_cos_bucket.foo.bucket
  filepath = "dist"
  region = var.region
}
```

Assume you have built the SPA assets to `dist` by using the front-end framework, the directory should like:

``` 
├──. # project root
│  ├── dist
│  │  ├── error.html
│  │  ├── index.html
│  │  └── scripts
│  │      └── index.js
│  ├── main.tf # terraform config file
│  ├── # ... other project files
```

Now you can run terraform commands at the project root:

```shell
$ terraform init
$ terraform get
$ terraform plan
$ terraform apply
```

**NOTE:** There is no need to add the auto-generated terraform files to VCS. Here is the example ignore file patterns:
```
.terraform/
.terraform*
*.log
*.exe
*.tfvars
terraform-provider-tencentcloud
terraform-provider-qcloud
terraform.tfstate*
terraform.tfstate.lock.info
terraform_private.txt
terraform_public.txt
```

For more details, check the [example](./example) .

## Variables
|name|type|description|default|
|:---:|:---:|:---|:---:|
region| string | Bucket Object region. | |
bucket| string | Bucket name which objects upload to. | |
obj_acl| string | The canned ACL to apply. | `private` |
filepath| string | Argument `path` of `fileset`. Indicates local path of files. | |
pattern| string | Argument `pattern` of function `fileset`. The matched files will uploaded. Default match all files including subdirectory. | `**` |

## Outputs

|name|description|type|
|:---:|:---|:---:|
file_list | list of files to be upload | list |
file_map | file key-value pairs, pattern: `localFile: remotePath` | map |

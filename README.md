# Terraform TencentCloud COS SPA Module

This module provides an easy way to upload local Single Application Page Assets to TencentCloud Cloud Object Storage(COS) Bucket.

## Installation

### Requirement 

- [Terraform](https://www.terraform.io/downloads.html) >= 0.14.06

### Environments
Configure your TencentCloud Credentials: 
```
export TENCENTCLOUD_SECRET_ID = "AKIDxxxx"
export TENCENTCLOUD_SECRET_KEY = "xxxx"
```

## Usage

Check the [example](./example) for basic usage.

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

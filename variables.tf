/**
 * Copyright 2020 Tencent Cloud, LLC
 *
 * Licensed under the Mozilla Public License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      https://www.mozilla.org/en-US/MPL/2.0/
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

variable "region" {
  type        = string
  description = "Bucket Object region."
}

variable "bucket" {
  type        = string
  description = "Bucket name which objects upload to."
}

variable "obj_acl" {
  type        = string
  default     = "private"
  description = "The canned ACL to apply."
}

variable "filepath" {
  type        = string
  default     = "dist"
  description = "Argument `path` of `fileset`. Indicates local path of files."
}

variable "pattern" {
  type        = string
  default     = "**"
  description = "Argument `pattern` of function `fileset`. The matched files will uploaded. Default match all files including subdirectory."
}
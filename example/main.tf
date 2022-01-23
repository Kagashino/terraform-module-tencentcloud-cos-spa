resource "tencentcloud_cos_bucket" "foo" {
  acl    = "public-read"
  bucket = "tf-cos-spa-${var.appid}"
  website {
    index_document = "index.html"
    error_document = "error.html"
  }
}

module "cos_spa_assets" {
  source   = "../."
  region   = "ap-guangzhou"
  filepath = "dist"
  obj_acl  = "public-read"
  bucket   = tencentcloud_cos_bucket.foo.bucket
}

output "files" {
  value = module.cos_spa_assets.file_list
}
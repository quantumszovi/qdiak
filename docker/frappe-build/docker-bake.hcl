variable "APP_NAME" {}
variable "FRAPPE_VERSION" {
  default = "14"
}
variable "IMAGE_BASE" {
  default = "ghcr.io/qdiak/iskolaszovi2"
}
variable "TAG" {
  default = "latest"
}

group "default" {
    targets = ["backend", "frontend"]
}
target "backend" {
    context = "/tmp/${APP_NAME}"
    dockerfile = "/wd/backend.Dockerfile"
    tags = ["${IMAGE_BASE}/worker:${TAG}"]
    args = {
      "FRAPPE_VERSION" = FRAPPE_VERSION
      "APP_NAME" = APP_NAME
    }
}
target "frontend" {
    context = "/tmp/${APP_NAME}"
    dockerfile = "/wd/frontend.Dockerfile"
    tags = ["${IMAGE_BASE}/nginx:${TAG}"]
    args = {
      "FRAPPE_VERSION" = FRAPPE_VERSION
      "APP_NAME" = APP_NAME
    }
}
variable "domain" {
  default = "example.com"
}

variable "region" {
  default = "fra1"
}

variable "ssh_keys" {
  default = []
}

variable "trusted_sources" {
  default = ["10.135.0.0/16"]
}

variable "access_key" {
  default = ""
}

variable "secret_key" {
  default = ""
}

variable "iamuser" {
  type    = list(any)
  default = ["akintoye", "akinsola", "kay", "oluyemi", "olasubomi", "dotun"]
}

variable "ssh_key" {
  default = ""
}

variable "bucket_name" {
  default = "lacardia.com"
  type    = string
}

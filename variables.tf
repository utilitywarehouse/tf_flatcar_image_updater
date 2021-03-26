variable "assets_path" {
  type        = string
  description = "Path to save assets under. Files will be downloaded to $assets_path/$channel/$version."
  default     = "/var/lib/matchbox/assets/flatcar"
}

variable "channel" {
  type        = string
  description = "The release channel to download"
  default     = "stable"
}

variable "current_version" {
  type        = string
  description = "The version that flatcar/$channel/current will point to. Defaults to the latest version."
  default     = ""
}

variable "fixed_versions" {
  type        = list(string)
  description = "Versions which the flatcar updater script will ensure are fetched and store under matchbox assets, in addition to the latest releases that it downloads."
  default     = []
}

variable "latest_images_count" {
  type        = string
  description = "The script will keep at least this many of the latest releases."
  default     = "3"
}

variable "sleep_duration" {
  type        = string
  description = "The amount of time, in seconds, that the script will wait between checks."
  default     = "3600"
}

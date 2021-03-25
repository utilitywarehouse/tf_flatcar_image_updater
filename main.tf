data "ignition_file" "flatcar_image_updater" {
  filesystem = "root"
  path       = "/opt/flatcar/flatcar-image-updater"
  mode       = 493

  content {
    content = file("${path.module}/resources/flatcar-image-updater")
  }
}

data "ignition_systemd_unit" "flatcar_image_updater" {
  name = "flatcar-image-updater.service"

  content = templatefile("${path.module}/templates/flatcar-image-updater.service", {
    assets_path         = var.assets_path,
    channel             = var.channel,
    current_version     = var.current_version,
    fixed_versions      = join(",", var.fixed_versions),
    latest_images_count = var.latest_images_count,
    sleep_duration      = var.sleep_duration,
  })
}

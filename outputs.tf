output "unit" {
  value = data.ignition_systemd_unit.flatcar_image_updater.rendered
}

output "file" {
  value = data.ignition_file.flatcar_image_updater.rendered
}

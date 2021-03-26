# tf_flatcar_image_updater

This module provides ignition configuration for deploying a service that will
download the latest releases of Flatcar Container Linux to a local path.

## Input Variables

The input variables are documented in their description and it's best to refer to [variables.tf](variables.tf).

## Outputs

- `file` - The rendered ignition file for the script
- `unit` - The rendered ignition systemd unit for the service

## Usage

```hcl2
module "flatcar_image_updater" {
  source = "github.com/utilitywarehouse/tf_flatcar_image_updater"
}

data "ignition_config" "node" {
  files = [
    module.flatcar_image_updater.file,
  ]

  systemd = [
    module.flatcar_image_updater.unit,
  ]
}
```

By default the script will keep the last 3 releases and maintain a symlink pointing to
the latest release at `${var.assets_path}/${var.channel}/current`. Older
releases will be removed.

The number of releases kept can be increased by changing the value of `var.latest_images_count`.

You can ensure that it downloads and keeps specific versions, additional to the
latest ones, by including them in the list `var.fixed_versions`.

The version the `current` symlink points to can be changed with
`var.current_version`.

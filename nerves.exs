use Mix.Config

version =
  Path.join(__DIR__, "VERSION")
  |> File.read!
  |> String.strip

pkg = :vision_system_rpi0

config pkg, :nerves_env,
  type: :system,
  version: version,
  compiler: :nerves_package,
  artifact_url: [
  # "https://github.com/nerves-project/#{pkg}/releases/download/v#{version}/#{pkg}-v#{version}.tar.gz",
    # "https://github.com/elcritch/#{pkg}/releases/download/#{version}/#{pkg}-#{version}.tar.gz", # TODO: prefix ver w/ 'v'
    "https://github.com/elcritch/#{pkg}/releases/download/v#{version}/#{pkg}-v#{version}.tar.gz", # TODO: prefix ver w/ 'v'
  ],
  platform: Nerves.System.BR,
  platform_config: [
    defconfig: "nerves_defconfig"
  ],
  checksum: [
    "nerves_defconfig",
    "rootfs-additions",
    "linux-4.4.defconfig",
    "fwup.conf",
    "cmdline.txt",
    "config.txt",
    "post-createfs.sh",
    "VERSION"
  ]

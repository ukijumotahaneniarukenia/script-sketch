- ファイルだーっとつくるやつ

```
$osqueryi .table | grep -Po '[a-z_]+' | awk '{printf("%05d-osquery-%sテーブルの抽出.md\n",NR,$1)}' | xargs -I@ touch @
$ls -1 *md | grep -v 00000 | while read tgt;do echo -e '- IN\n\n```\n```\n- CMD\n\n```\n```\n- OUT\n\n```\n```\n'>$tgt;done
```


- IN

```

```

- CMD


```
$osqueryi '.table'
```

- OUT

```
  => acpi_tables
  => apparmor_profiles
  => apt_sources
  => arp_cache
  => atom_packages
  => augeas
  => authorized_keys
  => block_devices
  => carbon_black_info
  => carves
  => chrome_extensions
  => cpu_time
  => cpuid
  => crontab
  => curl
  => curl_certificate
  => deb_packages
  => device_file
  => device_hash
  => device_partitions
  => disk_encryption
  => dns_resolvers
  => docker_container_labels
  => docker_container_mounts
  => docker_container_networks
  => docker_container_ports
  => docker_container_processes
  => docker_container_stats
  => docker_containers
  => docker_image_labels
  => docker_image_layers
  => docker_images
  => docker_info
  => docker_network_labels
  => docker_networks
  => docker_version
  => docker_volume_labels
  => docker_volumes
  => ec2_instance_metadata
  => ec2_instance_tags
  => elf_dynamic
  => elf_info
  => elf_sections
  => elf_segments
  => elf_symbols
  => etc_hosts
  => etc_protocols
  => etc_services
  => file
  => file_events
  => firefox_addons
  => groups
  => hardware_events
  => hash
  => intel_me_info
  => interface_addresses
  => interface_details
  => interface_ipv6
  => iptables
  => kernel_info
  => kernel_modules
  => known_hosts
  => last
  => listening_ports
  => lldp_neighbors
  => load_average
  => logged_in_users
  => magic
  => md_devices
  => md_drives
  => md_personalities
  => memory_array_mapped_addresses
  => memory_arrays
  => memory_device_mapped_addresses
  => memory_devices
  => memory_error_info
  => memory_info
  => memory_map
  => mounts
  => msr
  => npm_packages
  => oem_strings
  => opera_extensions
  => os_version
  => osquery_events
  => osquery_extensions
  => osquery_flags
  => osquery_info
  => osquery_packs
  => osquery_registry
  => osquery_schedule
  => pci_devices
  => platform_info
  => portage_keywords
  => portage_packages
  => portage_use
  => process_envs
  => process_events
  => process_file_events
  => process_memory_map
  => process_namespaces
  => process_open_files
  => process_open_pipes
  => process_open_sockets
  => processes
  => prometheus_metrics
  => python_packages
  => routes
  => rpm_package_files
  => rpm_packages
  => selinux_events
  => selinux_settings
  => shadow
  => shared_memory
  => shell_history
  => smart_drive_info
  => smbios_tables
  => socket_events
  => ssh_configs
  => sudoers
  => suid_bin
  => syslog_events
  => system_controls
  => system_info
  => time
  => ulimit_info
  => uptime
  => usb_devices
  => user_events
  => user_groups
  => user_ssh_keys
  => users
  => yara
  => yara_events
  => yum_sources
```

Packer build of Windows 10 LTSC
==

This is a packer build of the Windows 10 LTSC (Evaluation image), weighing in at around 20GB

Run `./build.sh` to start the build. Final disk image will be in the `outputs/` directory in qcow2 format.


Flow
==
- Build script downloads virtio ISO, and extracts to directory
- Packer runs `windows.json`, mounts virtio directory, and adds the content of `scripts/` as a floppy drive
- System build can be monitored via VNC on port 5900
- `Autounattend.xml` configures disk, locale, adds virtio drivers for storage and network
- As part of the `Autounattend.xml` the network scripts and ansible prep gets run
- Ansible then takes over, just doing some compacting bits. Easy to add other stuff in here.
- Ansible also install all windows updates
- System has sysprep run to generalise (New SID etc) then shuts down.
- Build is complete at this point. Next or 'first' boot uses unattend.xml for config.


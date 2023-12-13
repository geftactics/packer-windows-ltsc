#!/usr/bin/env bash

set -eu -o pipefail

VIRTIO_WIN_ISO_URL=https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/archive-virtio/virtio-win-0.1.240-1/virtio-win-0.1.240.iso
VIRTIO_WIN_ISO=virtio-win.iso
VIRTIO_WIN_ISO_DIR=virtio-win

test -f "${VIRTIO_WIN_ISO}" || curl -sL "${VIRTIO_WIN_ISO_URL}" --output "${VIRTIO_WIN_ISO}"
if [[ ! -d "${VIRTIO_WIN_ISO_DIR}" ]]; then
    xorriso -report_about SORRY -osirrox on -indev "${VIRTIO_WIN_ISO}" -extract / "${VIRTIO_WIN_ISO_DIR}"
    find "${VIRTIO_WIN_ISO_DIR}" -type d -exec chmod u+rwx {} \;
fi

PACKER_LOG=0 packer build windows.json
